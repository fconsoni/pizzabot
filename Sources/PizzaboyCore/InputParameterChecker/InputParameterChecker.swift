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
}

final class InputParameterChecker: InputParameterCheckable {
	private let parser: Parseable
	
	init(parser: Parseable = Parser()) {
		self.parser = parser
	}
	
	func isValid(_ argument: String) -> Bool {
		return self.hasValidGrid(on: argument) && self.hasValidPoints(on: argument)
	}
	
	//MARK:- grid
	private func hasValidGrid(on argument: String) -> Bool {
		if let gridComponent = self.components(of: argument).first {
			return self.validGridFormat(in: gridComponent)
		} else {
			return false
		}
	}
	
	private func validGridFormat(in gridComponent: String) -> Bool {
		return gridComponent.components(separatedBy: CharacterSet(charactersIn: "xx")).compactMap(Int.init).count == 2
	}
	
	//MARK:- points
	private func hasValidPoints(on argument: String) -> Bool {
		let pointComponents = self.components(of: argument).tail()
		
		return !pointComponents.isEmpty && pointComponents.all(isValidPoint) && argument.last ?? Character("") == Character(")")
	}
	
	private func isValidPoint(_ pointComponent: String) -> Bool {
		return pointComponent.components(separatedBy: CharacterSet(charactersIn: "(,)")).compactMap(Int.init).count == 2
	}
	
	//MARK:- components
	private func components(of argument: String) -> [String] {
		let trimmedComponents = argument.separateBy("(").map{ $0.trim() }
		
		return trimmedComponents.take(1) + trimmedComponents.tail().map{ "(\($0)" }
	}
}
