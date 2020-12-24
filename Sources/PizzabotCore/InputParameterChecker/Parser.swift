//
//  Parser.swift
//  
//
//  Created by Franco Consoni on 23/12/2020.
//

import Foundation
import FunctionalUtils

protocol Parseable {
	func grid(from argument: String) -> Grid
	func points(from components: [String]) -> [CGPoint?]
}

final class Parser: Parseable {
	func grid(from argument: String) -> Grid {
		let coordinates = argument.components(separatedBy: CharacterSet(charactersIn: "xx")).compactMap(Int.init)
		
		return Grid(rows: coordinates.first ?? 0,
					columns: coordinates.last ?? 0)
	}
	
	func points(from components: [String]) -> [CGPoint?] {
		return []
	}
}
