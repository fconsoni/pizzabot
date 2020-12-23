//
//  Outputable.swift
//  
//
//  Created by Franco Consoni on 23/12/2020.
//

import Foundation

public protocol Outputable {
	func write(_ message: String)
}

public struct ConsoleOutput: Outputable {
	public init() {}
	
	public func write(_ message: String) {
		print(message)
	}
}
