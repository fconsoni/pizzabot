//
//  PizzaboyCore.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation
import FunctionalUtils
import Rainbow

public final class Pizzaboy {
	private let argument: String?
	
	public init(arguments: [String] = CommandLine.arguments) {
		self.argument = arguments.tail().first
	}
	
	public func run() throws {
		if self.argument.isEmpty() {
			throw PizzaboyError.missingParameter
		} else {
			throw PizzaboyError.invalidArgument(argument: self.argument!)
		}
	}
}
