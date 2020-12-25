//
//  PizzabotCore.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation
import FunctionalUtils
import Logger

public struct PizzabotConfiguration {
	let argumentChecker: InputParameterCheckable
	let parameterRetriever: InputParameterRetrievable
	let deliverier: Deliverable
	let logger: Logger
	
	public static var `default`: PizzabotConfiguration {
		let defaultLogger = Logger()
		
		return PizzabotConfiguration(argumentChecker: InputParameterChecker(),
									 parameterRetriever: InputParameterRetriever(),
									 deliverier: PizzabotDeliverier(logger: defaultLogger),
									 logger: defaultLogger)
	}
}

public final class Pizzabot {
	private let argument: String?
	private let config: PizzabotConfiguration
	
	public init(config: PizzabotConfiguration = .default, arguments: [String] = CommandLine.arguments) {
		self.config = config
		self.argument = arguments.tail().first
	}
	
	public func run() throws {
		self.config.logger.log(message: "Checking argument")
		
		guard let argument = self.argument else {
			throw PizzabotError.missingParameter
		}
		
		if self.config.argumentChecker.isValid(argument) {
			try self.recoverParameters(from: argument)
		} else {
			throw PizzabotError.invalid(argument: argument)
		}
	}
	
	private func recoverParameters(from argument: String) throws {
		self.config.logger.log(message: "Attempting to parse parameters")
		
		let grid = self.config.parameterRetriever.grid(from: argument)
		
		if self.config.argumentChecker.isValid(grid: grid) {
			self.config.logger.log(message: "Grid and points parsed succesfully!")
			
			self.deliverPizza(to: grid)
		} else {
			throw PizzabotError.pointOutOfGrid
		}
	}
	
	private func deliverPizza(to grid: Grid) {
		self.config.logger.log(message: "Starting pizza delivery")
		
		self.config.deliverier.deliver(in: grid)
	}
}
