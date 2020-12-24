//
//  File.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation

public enum PizzabotError: Error {
	case invalid(argument: String)
	case missingParameter
	
	public func description() -> String {
		switch self {
		case .invalid(argument: let argument):
			return "Invalid argument format of: \"\(argument)\""
		case .missingParameter:
			return "Missing parameter"
		}
	}
}
