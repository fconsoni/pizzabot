//
//  File.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation

public enum PizzabotError: Error, Equatable {
	case invalid(argument: String)
	case missingParameter
	case pointOutOfGrid
	
	public func description() -> String {
		switch self {
		case .invalid(argument: let argument):
			return "Invalid argument format of: \"\(argument)\""
		case .missingParameter:
			return "Missing parameter"
		case .pointOutOfGrid:
			return "One or more points are out of the grid bounds"
		}
	}
}
