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
	private let checker = InputParameterChecker()
	
	func testThatEmptyArgumentIsNotValid() {
		let argument = ""
		
		XCTAssertFalse(checker.isValid(argument))
	}
	
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
	
	func testThatPointsOutOfBoundsAreNotValid() {
		let points = [Point(x: 1, y: 4)]
		let grid = Grid(rows: 3, columns: 3)
		
		XCTAssertFalse(checker.areValid(points, in: grid))
	}
	
	func testThatNegativePointsAreNotValid() {
		let points = [Point(x: -1, y: 4)]
		let grid = Grid(rows: 3, columns: 3)
		
		XCTAssertFalse(checker.areValid(points, in: grid))
	}
	
	func testThatPointsInBoundsAreValid() {
		let points = [Point(x: 1, y: 3)]
		let grid = Grid(rows: 3, columns: 3)
		
		XCTAssertTrue(checker.areValid(points, in: grid))
	}
	
	func testThatPointsInTheEdgeAreValid() {
		let points = [Point(x: 3, y: 3)]
		let grid = Grid(rows: 3, columns: 3)
		
		XCTAssertTrue(checker.areValid(points, in: grid))
	}
	
	func testThatNegativeGridIsNotValidValid() {
		let points = [Point(x: 3, y: 3)]
		let grid = Grid(rows: -3, columns: 3)
		
		XCTAssertFalse(checker.areValid(points, in: grid))
	}
	
	static var allTests = [
		("testThatEmptyArgumentIsNotValid", testThatEmptyArgumentIsNotValid),
		("testThatLowercasedXCorrectArgumentIsValid", testThatLowercasedXCorrectArgumentIsValid),
		("testThatUppercasedXCorrectArgumentIsValid", testThatUppercasedXCorrectArgumentIsValid),
		("testThatArgumentWithoutMatrixIsNotValid", testThatArgumentWithoutMatrixIsNotValid),
		("testThatArgumentWithoutPointsIsNotValid", testThatArgumentWithoutPointsIsNotValid),
		("testThatBadFormatIsNotValid", testThatBadFormatIsNotValid),
		("testThatLettersInArgumentIsNotValid", testThatLettersInArgumentIsNotValid),
		("testThatLettersInPointsIsNotValid", testThatLettersInPointsIsNotValid),
		("testThatLettersInMatrixIsNotValid", testThatLettersInMatrixIsNotValid),
		("testThatPointsOutOfBoundsAreNotValid", testThatPointsOutOfBoundsAreNotValid),
		("testThatNegativePointsAreNotValid", testThatNegativePointsAreNotValid),
		("testThatPointsInBoundsAreValid", testThatPointsInBoundsAreValid),
		("testThatPointsInTheEdgeAreValid", testThatPointsInTheEdgeAreValid),
		("testThatNegativeGridIsNotValidValid", testThatNegativeGridIsNotValidValid)
	]
}
