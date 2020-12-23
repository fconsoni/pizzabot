//
//  OptionalUtils.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation

extension Optional {
	public func get(_ error: Error? = nil) throws -> Wrapped {
		switch self {
		case .none:
			throw error ?? NSError(domain: "No wrapped value: \(String(describing: self))", code: 0, userInfo: nil)
		case .some(let some): return some
		}
	}
	
	public func filter(_ fx: (Wrapped) -> Bool) -> Optional {
		switch self {
		case .none: return self
		case .some(let some): return fx(some) ? self : .none
		}
	}
	
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

public func getOrElse<A>(_ defValue: A) -> (A?) -> A {
	return { optional in optional.getOrElse(defValue) }
}

public func isEmpty<A>(_ optional: A?) -> Bool {
	return optional.isEmpty()
}

public func fold<T, U>(_ ifEmpty: U, _ tx: @escaping (T) -> U) -> (T?) -> U {
	return { optional in optional.fold(ifEmpty, tx) }
}
