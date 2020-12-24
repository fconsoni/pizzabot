//
//  PizzaboyCore.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation
import FunctionalUtils
import Logger

public struct PizzaboyConfiguration {
	let argumentChecker: InputParameterCheckable
	
	public static var `default`: PizzaboyConfiguration {
		return PizzaboyConfiguration(argumentChecker: InputParameterChecker())
	}
}

public final class Pizzaboy {
	private let argument: String?
	private let config: PizzaboyConfiguration
	
	public init(config: PizzaboyConfiguration = .default, arguments: [String] = CommandLine.arguments) {
		self.config = config
		self.argument = arguments.tail().first
	}
	
	public func run() throws {
		guard let argument = self.argument else {
			throw PizzaboyError.missingParameter
		}
		
		Logger().log(message: "checking argument format...")
		
		if self.config.argumentChecker.isValid(argument) {
			Logger().log(message: "valid")
		} else {
			throw PizzaboyError.invalid(argument: argument)
		}
	}
}
