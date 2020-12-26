//
//  public functions.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation

//MARK:- currying public functions
public func curry<A,B,R>(_ f: @escaping (A, B) -> R) -> (A) -> (B) -> (R) {
	return { a in { b in f(a,b) } }
}

//MARK:- logic public functions
public func equalTo<A: Equatable>(_ elem: A) -> (A) -> Bool {
	return { otherElem in elem == otherElem }
}

//MARK:- mathematic tools
precedencegroup PowPrecedence {
	associativity: left
	higherThan: MultiplicationPrecedence
}

infix operator **: PowPrecedence
public func ** (_ base: Int, _ power: Int) -> Float {
	return pow(Float(base), Float(power))
}
