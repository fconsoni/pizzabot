//
//  Movement.swift
//  
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation

enum Movement {
	case north
	case east
	case south
	case west
	case drop
	
	func code() -> String {
		switch self {
		case .north:
			return "N"
		case .east:
			return "E"
		case .south:
			return "S"
		case .west:
			return "W"
		case .drop:
			return "D"
		}
	}
}
