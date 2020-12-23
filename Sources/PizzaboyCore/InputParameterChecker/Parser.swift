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
	func points(from argument: String) -> [CGPoint?]
	func components(of argument: String) -> [String]
}

final class Parser: Parseable {
	func grid(from argument: String) -> Grid {
		let coordinates = argument.components(separatedBy: CharacterSet(charactersIn: "xx")).compactMap(Int.init)
		
		return Grid(rows: coordinates.first ?? 0,
					columns: coordinates.last ?? 0)
	}
	
	func points(from argument: String) -> [CGPoint?] {
		return []
	}
	
	func components(of argument: String) -> [String] {
		let trimmedComponents = argument.separateBy("(").map{ $0.trim() }
		
		return trimmedComponents.take(1) + trimmedComponents.tail().map{ "(\($0)" }
	}
}
