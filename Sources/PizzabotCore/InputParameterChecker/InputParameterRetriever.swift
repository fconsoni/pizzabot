//
//  InputParameterRetriever.swift
//  
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation

protocol InputParameterRetrievable {
	func grid(from argument: String) -> Grid
	func points(from argument: String) -> [Point]
}

final class InputParameterRetriever: InputParameterRetrievable, ArgumentSplittable {
	//MARK:- grid
	func grid(from argument: String) -> Grid {
		let coordinates = self.gridComponent(of: argument)
			.components(separatedBy: CharacterSet(charactersIn: "xx"))
			.compactMap(Int.init)
		
		return Grid(rows: coordinates.first ?? 0,
					columns: coordinates.last ?? 0)
	}
	
	//MARK:- points
	func points(from argument: String) -> [Point] {
		return self.pointsComponents(of: argument).map(makePoint(from:))
	}
	
	private func makePoint(from component: String) -> Point {
		let coordinates = component.components(separatedBy: CharacterSet(charactersIn: "(,)")).map(String.trim).compactMap(Int.init)
		
		return Point(x: coordinates.first ?? 0,
					 y: coordinates.last ?? 0)
	}
	
	//MARK:- argument components
	private func gridComponent(of fullArgument: String) -> String {
		return self.components(of: fullArgument).first ?? ""
	}
	
	private func pointsComponents(of fullArgument: String) -> [String] {
		return self.components(of: fullArgument).tail()
	}
}
