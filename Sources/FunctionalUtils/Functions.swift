//
//  public functions.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation

//MARK:- generic public functions
public func identity<T>(_ any: T) -> T {
	return any
}

public func nop() {}

public func nop<T>(_ t: T) {}

//MARK:- currying public functions
public func curry<A,B,R>(_ f: @escaping (A, B) -> R) -> (A) -> (B) -> (R) {
	return { a in { b in f(a,b) } }
}

//MARK:- logic public functions
public func equalTo<A: Equatable>(_ elem: A) -> (A) -> Bool {
	return { otherElem in elem == otherElem }
}

public func not(_ value: Bool) -> Bool {
	return !value
}

//MARK:- composition public function
precedencegroup CompositionPrecedence {
	associativity: right
	higherThan: BitwiseShiftPrecedence
}

infix operator << : CompositionPrecedence
public func << <T,U,V>(_ f: @escaping (U) -> V, _ g: @escaping (T) -> U) -> (T) -> V {
	return { f(g($0)) }
}

public func << <T,U,V>(_ f: @escaping (U) -> V, _ g: @escaping (T) -> () -> (U)) -> (T) -> V {
	return { f(g($0)()) }
}

//MARK:- mathematic tools
precedencegroup PowPrecedence {
	associativity: left
	higherThan: MultiplicationPrecedence
}

infix operator **: PowPrecedence
public func ** (_ base: Float, _ power: Float) -> Float {
	return pow(base, power)
}

public func ** (_ base: Int, _ power: Int) -> Float {
	return pow(Float(base), Float(power))
}
