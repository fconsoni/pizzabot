//
//  File.swift
//  
//
//  Created by Franco Consoni on 25/12/2020.
//

import Foundation
import XCTest
@testable import PizzabotCore

final class PointTests: XCTestCase {
	func testThatAllPositivePointIsValid() {
		XCTAssertTrue(Point(x: 1, y: 2).isValid())
	}
	
	func testThatAllZeroPointIsValid() {
		XCTAssertTrue(Point(x: 0, y: 0).isValid())
	}
	
	func testThatAnyNegativeCoordinateInPointIsNotValid() {
		XCTAssertFalse(Point(x: -1, y: 2).isValid())
		XCTAssertFalse(Point(x: 1, y: -2).isValid())
	}
	
	func testThatAllNegativeCoordinateInPointIsNotValid() {
		XCTAssertFalse(Point(x: -1, y: -2).isValid())
	}
	
	func testThatCalculatesTheCorrectDistanceToOtherPoint() {
		let point = Point(x: 1, y: 1)
		let otherPoint = Point(x: 2, y: 2)
		
		XCTAssertEqual(point.distanceTo(otherPoint), sqrt(2))
	}
	
	func testThatCopyFunctionWorks() {
		let point = Point(x: 1, y: 1)
		
		XCTAssertEqual(point.copy(x: 2), Point(x: 2, y: 1))
		XCTAssertEqual(point.copy(y: 2), Point(x: 1, y: 2))
	}
	
	static var allTests = [
		("testThatAllPositivePointIsValid", testThatAllPositivePointIsValid),
		("testThatAllZeroPointIsValid", testThatAllZeroPointIsValid),
		("testThatAnyNegativeCoordinateInPointIsNotValid", testThatAnyNegativeCoordinateInPointIsNotValid),
		("testThatAllNegativeCoordinateInPointIsNotValid", testThatAllNegativeCoordinateInPointIsNotValid),
		("testThatCalculatesTheCorrectDistanceToOtherPoint", testThatCalculatesTheCorrectDistanceToOtherPoint),
		("testThatCopyFunctionWorks", testThatCopyFunctionWorks)
	]
}
