//
//  PizzaboyCore.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation
import FunctionalUtils

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
		
		if self.config.argumentChecker.isValid(argument) {
			print("Todo bien")
		} else {
			throw PizzaboyError.invalid(argument: argument)
		}
	}
}
