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
	let logger: Logger
	
	public static var `default`: PizzabotConfiguration {
		return PizzabotConfiguration(argumentChecker: InputParameterChecker(),
									 parameterRetriever: InputParameterRetriever(),
									 logger: Logger())
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
		let points = self.config.parameterRetriever.points(from: argument)
		
		if self.config.argumentChecker.areValid(points, in: grid) {
			self.config.logger.log(success: "Grid and points parsed succesfully!")
			
			self.deliver(to: points, in: grid)
		} else {
			throw PizzabotError.pointOutOfGrid
		}
	}
	
	private func deliver(to points: [Point], in grid: Grid) {
		self.config.logger.log(message: "Attempting to parse parameters")
	}
}
