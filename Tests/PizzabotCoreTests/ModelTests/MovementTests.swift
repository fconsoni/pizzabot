//
//  MovementTests.swift
//  
//
//  Created by Franco Consoni on 25/12/2020.
//

import Foundation
import XCTest
@testable import PizzabotCore

final class MovementTests: XCTestCase {
	func testThatAllCodesWorksCorrectly() {
		XCTAssertEqual(Movement.allCases.map(Movement.code), ["N", "E", "S", "W", "D"])
	}
	
	static var allTests = [
		("testThatAllCodesWorksCorrectly", testThatAllCodesWorksCorrectly)
	]
}
