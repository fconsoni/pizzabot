//
//  Logger.swift
//  
//
//  Created by Franco Consoni on 23/12/2020.
//

import Foundation
import Rainbow

public final class Logger {
	private let output: Outputable
	
	public init(output: Outputable = ConsoleOutput()) {
		self.output = output
	}
	
	public func log(success: String) {
		self.output.write("SUCCESS: ".green.bold + success)
	}
	
	public func log(message: String) {
		self.output.write("MESSAGE: ".white.bold + message)
	}
	
	public func log(warning: String) {
		self.output.write("WARNING: ".yellow.bold + warning)
	}
	
	public func log(error: String) {
		self.output.write("ERROR: ".red.bold + error)
	}
}
