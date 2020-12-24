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
	
	public static var `default`: PizzabotConfiguration {
		return PizzabotConfiguration(argumentChecker: InputParameterChecker(),
									 parameterRetriever: InputParameterRetriever())
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
		guard let argument = self.argument else {
			throw PizzabotError.missingParameter
		}
		
		Logger().log(message: "checking argument format...")
		
		if self.config.argumentChecker.isValid(argument) {
			Logger().log(message: "valid")
		} else {
			throw PizzabotError.invalid(argument: argument)
		}
	}
}
