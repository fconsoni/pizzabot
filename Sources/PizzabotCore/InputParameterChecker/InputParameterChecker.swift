//
//  InputParameterChecker.swift
//  
//
//  Created by Franco Consoni on 23/12/2020.
//

import Foundation
import FunctionalUtils

protocol InputParameterCheckable {
	func isValid(_ argument: String) -> Bool
	func areValid(_ points: [Point], in grid: Grid) -> Bool
}

final class InputParameterChecker: InputParameterCheckable, ArgumentSplittable {
	func isValid(_ argument: String) -> Bool {
		return self.hasValidGrid(on: argument) && self.hasValidPoints(on: argument)
	}
	
	func areValid(_ points: [Point], in grid: Grid) -> Bool {
		return points.all(grid.isIn) && points.all(Point.isValid) && grid.isValid()
	}
	
	//MARK:- grid validation
	private func hasValidGrid(on argument: String) -> Bool {
		if let gridComponent = self.components(of: argument).first {
			return self.validGridFormat(in: gridComponent)
		} else {
			return false
		}
	}
	
	private func validGridFormat(in gridComponent: String) -> Bool {
		return gridComponent.separateBy("xX").compactMap(Int.init).count == 2
	}
	
	//MARK:- points validation
	private func hasValidPoints(on argument: String) -> Bool {
		let pointComponents = self.components(of: argument).tail()
		
		return !pointComponents.isEmpty && pointComponents.all(isValidPoint)
	}
	
	private func isValidPoint(_ pointComponent: String) -> Bool {
		let hasTwoNumbers = pointComponent.separateBy("(,)").map(String.trim).compactMap(Int.init).count == 2
		
		return hasTwoNumbers && pointComponent.last.fold(false, equalTo(Character(")")))
	}
}
