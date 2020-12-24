//
//  LoggerTests.swift
//  
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation
import XCTest
@testable import Logger

final class LoggerTests: XCTestCase {
	private let mockedOutput = MockOutput()
	
	override func setUp() {
		self.mockedOutput.clean()
	}
	
	func testThatSuccessLogWritesCorrectly() {
		let logger = Logger(output: mockedOutput)
		let message = "message"
		
		logger.log(success: message)
		
		XCTAssertEqual("SUCCESS: ".green.bold + message, mockedOutput.messageWrote)
	}
	
	func testThatCommonLogWritesCorrectly() {
		let logger = Logger(output: mockedOutput)
		let message = "message"
		
		logger.log(message: message)
		
		XCTAssertEqual("LOG: ".white.bold + message, mockedOutput.messageWrote)
	}
	
	func testThatWarningLogWritesCorrectly() {
		let logger = Logger(output: mockedOutput)
		let message = "message"
		
		logger.log(warning: message)
		
		XCTAssertEqual("WARNING: ".yellow.bold + message, mockedOutput.messageWrote)
	}
	
	func testThatErrorLogWritesCorrectly() {
		let logger = Logger(output: mockedOutput)
		let message = "message"
		
		logger.log(error: message)
		
		XCTAssertEqual("ERROR: ".red.bold + message, mockedOutput.messageWrote)
	}
	
	static var allTests = [
		("testThatSuccessLogWritesCorrectly", testThatSuccessLogWritesCorrectly),
		("testThatCommonLogWritesCorrectly", testThatCommonLogWritesCorrectly),
		("testThatWarningLogWritesCorrectly", testThatWarningLogWritesCorrectly),
		("testThatErrorLogWritesCorrectly", testThatErrorLogWritesCorrectly)
	]
}

private final class MockOutput: Outputable {
	private(set) var messageWrote: String = ""
	
	func write(_ message: String) {
		self.messageWrote = message
	}
	
	func clean() {
		self.messageWrote = ""
	}
}
