//
//  InputParameterCheckerTests.swift
//  
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation
import XCTest
@testable import PizzabotCore

final class InputParameterCheckerTests: XCTestCase {
	private let checker = InputParameterChecker(parser: MockParser())
	
	func testThatLowercasedXCorrectArgumentIsValid() {
		let argument = "5x5 (0,1) (1,2)"
		
		XCTAssertTrue(checker.isValid(argument))
	}
	
	func testThatUppercasedXCorrectArgumentIsValid() {
		let argument = "5X5 (0,1) (1,2)"
		
		XCTAssertTrue(checker.isValid(argument))
	}
	
	func testThatArgumentWithoutMatrixIsNotValid() {
		let argument = "(0,1) (1,2)"
		
		XCTAssertFalse(checker.isValid(argument))
	}
	
	func testThatArgumentWithoutPointsIsNotValid() {
		let argument = "5X5"
		
		XCTAssertFalse(checker.isValid(argument))
	}
	
	func testThatBadFormatIsNotValid() {
		let argument = "5X5 (1,0"
		let otherArgument = "5X5 1,0)"
		
		XCTAssertFalse(checker.isValid(argument))
		XCTAssertFalse(checker.isValid(otherArgument))
	}
	
	func testThatLettersInArgumentIsNotValid() {
		let argument = "nXm (a,b)"
		
		XCTAssertFalse(checker.isValid(argument))
	}
	
	func testThatLettersInPointsIsNotValid() {
		let argument = "5X5 (a,b)"
		
		XCTAssertFalse(checker.isValid(argument))
	}
	
	func testThatLettersInMatrixIsNotValid() {
		let argument = "aXa (1,2)"
		
		XCTAssertFalse(checker.isValid(argument))
	}
	
	static var allTests = [
		("testThatLowercasedXCorrectArgumentIsValid", testThatLowercasedXCorrectArgumentIsValid),
		("testThatUppercasedXCorrectArgumentIsValid", testThatUppercasedXCorrectArgumentIsValid),
		("testThatArgumentWithoutMatrixIsNotValid", testThatArgumentWithoutMatrixIsNotValid),
		("testThatArgumentWithoutPointsIsNotValid", testThatArgumentWithoutPointsIsNotValid),
		("testThatBadFormatIsNotValid", testThatBadFormatIsNotValid),
		("testThatLettersInArgumentIsNotValid", testThatLettersInArgumentIsNotValid),
		("testThatLettersInPointsIsNotValid", testThatLettersInPointsIsNotValid),
		("testThatLettersInMatrixIsNotValid", testThatLettersInMatrixIsNotValid),
	]
}


final class MockParser: Parseable {
	func grid(from argument: String) -> Grid {
		return Grid(rows: 0,columns: 0)
	}
	
	func points(from components: [String]) -> [Point] {
		return []
	}
}
