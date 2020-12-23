//
//  Outputable.swift
//  
//
//  Created by Franco Consoni on 23/12/2020.
//

import Foundation

public protocol Outputable {
	func print(_ message: String)
}

public struct ConsoleOutput: Outputable {
	public func print(_ message: String) {
		print(message)
	}
}
