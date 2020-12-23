//
//  File.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation

public enum PizzaboyError: Error {
	case invalidArgument(argument: String)
	case missingParameter
	
	func description() -> String {
		switch self {
		case .invalidArgument(argument: let argument):
			return "Invalid argument format of: \(argument)"
		case .missingParameter:
			return "Missing parameter"
		}
	}
}
