//
//  DeliverierTests.swift
//  
//
//  Created by Franco Consoni on 25/12/2020.
//

import Foundation
import XCTest
import Logger
@testable import PizzabotCore

final class DeliverierTests: XCTestCase {
	private let mockOutput = MockOutput()
	private var mockLogger: Logger {
		return Logger(output: mockOutput)
	}
	
	override func setUp() {
		self.mockOutput.clean()
	}
	
	func testThatDeliversPizzaCorrectly() {
		let grid = Grid(rows: 1, columns: 1, pendingPoints: [Point(x: 1, y: 1)])
		let deliverier = PizzabotDeliverier(logger: self.mockLogger)
		
		deliverier.deliver(in: grid)
		
		XCTAssertEqual(mockOutput.messageWrote.words().last ?? "", "NED")
	}
	
	func testThatCanDeliverPizzaInOrigin() {
		let grid = Grid(rows: 1, columns: 1, pendingPoints: [Point(x: 0, y: 0)])
		let deliverier = PizzabotDeliverier(logger: self.mockLogger)
		
		deliverier.deliver(in: grid)
		
		XCTAssertEqual(mockOutput.messageWrote.words().last ?? "", "D")
	}
	
	func testThatCanDeliverPizzaEfficiently() {
		let points = [Point(x: 0, y: 0), Point(x: 0, y: 3), Point(x: 4, y: 2), Point(x: 3, y: 0)]
		let grid = Grid(rows: 4, columns: 4, pendingPoints: points)
		let deliverier = PizzabotDeliverier(logger: self.mockLogger)
		
		deliverier.deliver(in: grid)
		
		XCTAssertEqual(mockOutput.messageWrote.words().last ?? "", "DNNNDEEEESDSSWD")
	}
	
	static var allTests = [
		("testThatDeliversPizzaCorrectly", testThatDeliversPizzaCorrectly),
		("testThatCanDeliverPizzaInOrigin", testThatCanDeliverPizzaInOrigin),
		("testThatCanDeliverPizzaEfficiently", testThatCanDeliverPizzaEfficiently)
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
