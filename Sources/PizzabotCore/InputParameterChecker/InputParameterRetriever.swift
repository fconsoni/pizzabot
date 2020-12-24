//
//  File.swift
//  
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation

protocol InputParameterRetrievable {
	func retrieveGrid(from argument: String) -> Grid
	func retrievePoints(from argument: String) -> [Point]
}

final class InputParameterRetriever: InputParameterRetrievable, ArgumentSplittable {
	func retrieveGrid(from argument: String) -> Grid {
		return Grid(rows: 0, columns: 0)
	}
	
	func retrievePoints(from argument: String) -> [Point] {
		return []
	}
}
