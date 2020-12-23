//
//  Logger.swift
//  
//
//  Created by Franco Consoni on 23/12/2020.
//

import Foundation
import Rainbow

final class Logger {
	private let output: Outputable
	
	public init(output: Outputable = ConsoleOutput()) {
		self.output = output
	}
	
	public func log(success: String) {
		self.output.print("SUCCESS:   ".green.bold + success)
	}
	
	public func log(message: String) {
		self.output.print("MESSAGE:   ".white.bold + message)
	}
	
	public func log(warning: String) {
		self.output.print("WARNING:   ".yellow.bold + warning)
	}
	
	public func log(error: String) {
		self.output.print("ERROR:   ".red.bold + error)
	}
}
