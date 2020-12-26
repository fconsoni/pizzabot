//
//  OptionalUtils.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation

//SCALA based extension
extension Optional {
	public func isEmpty() -> Bool {
		switch self {
		case .some(_): return false
		case .none: return true
		}
	}
	
	public func fold<U>(_ ifEmpty: U, _ tx : (Wrapped) -> U) -> U {
		switch self {
		case .some(let value): return tx(value)
		case .none: return ifEmpty
		}
	}
	
	public func getOrElse(_ ifEmpty: Wrapped) -> Wrapped {
		switch self {
		case .some(let value): return value
		case .none: return ifEmpty
		}
	}
	
	public func onValue(_ fx: (Wrapped) -> Void) {
		self.fold((), fx)
	}
}
