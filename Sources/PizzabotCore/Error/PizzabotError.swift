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
	case pointOutOfGrid(point: Point)
	
	public func description() -> String {
		switch self {
		case .invalid(argument: let argument):
			return "Invalid argument format of: \"\(argument)\""
		case .missingParameter:
			return "Missing parameter"
		case .pointOutOfGrid(let point):
			return "Point: (\(point.x),\(point.y) is out of the grid bounds"
		}
	}
}
