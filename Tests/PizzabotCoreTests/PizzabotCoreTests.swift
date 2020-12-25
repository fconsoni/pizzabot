//
//  InputParameterCheckerTests.swift
//
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation
import XCTest
import Logger
@testable import PizzabotCore

final class PizzabotCoreTests: XCTestCase {
	private func mockedConfig(validArgument: Bool, validPoints: Bool) -> PizzabotConfiguration {
		return PizzabotConfiguration(argumentChecker: MockInputChecker(validArgument: validArgument, validPoints: validPoints),
									 parameterRetriever: MockParametersRetriever(),
									 deliverier: MockDeliverier(),
									 logger: Logger(output: MockOutput()))
	}
	
	func testThatFailsWithLessArgumentsThatNeeded() {
		let arguments = ["unusedToolName"]
		let core = Pizzabot(config: mockedConfig(validArgument: false, validPoints: false), arguments: arguments)
		
		assert(try core.run(), throws: PizzabotError.missingParameter)
	}
	
	func testThatFailsWithBadFormattedArgument() {
		let arguments = ["unusedToolName", "badFormattedArgument"]
		let core = Pizzabot(config: mockedConfig(validArgument: false, validPoints: false), arguments: arguments)
		
		assert(try core.run(), throws: PizzabotError.invalid(argument: arguments.last!))
	}
	
	func testThatFailsWithPointsOutOfGrid() {
		let arguments = ["unusedToolName", "wellFormattedArgument"]
		let core = Pizzabot(config: mockedConfig(validArgument: true, validPoints: false), arguments: arguments)
		
		assert(try core.run(), throws: PizzabotError.pointOutOfGrid)
	}
	
	func testThatDoesntFailWithCorrectArguments() {
		let arguments = ["unusedToolName", "wellFormattedArgument"]
		let core = Pizzabot(config: mockedConfig(validArgument: true, validPoints: true), arguments: arguments)
		
		XCTAssertNoThrow(try core.run())
	}
	
	static var allTests = [
		("testThatFailsWithLessArgumentsThatNeeded", testThatFailsWithLessArgumentsThatNeeded),
		("testThatFailsWithBadFormattedArgument", testThatFailsWithBadFormattedArgument),
		("testThatFailsWithLessArgumentsThatNeeded", testThatFailsWithLessArgumentsThatNeeded),
		("testThatFailsWithPointsOutOfGrid", testThatFailsWithPointsOutOfGrid)
	]
}

//Helps to test error types
extension XCTestCase {
	func assert<T, E: Error & Equatable>(_ expression: @autoclosure () throws -> T, throws error: E, in file: StaticString = #file, line: UInt = #line) {
		var thrownError: Error?
		
		XCTAssertThrowsError(try expression(),file: file, line: line) {
			thrownError = $0
		}
		
		XCTAssertTrue(thrownError is E, "Unexpected error type: \(type(of: thrownError))", file: file, line: line)
		XCTAssertEqual(thrownError as? E, error, file: file, line: line)
	}
}

//MARK:- mocks
private final class MockInputChecker: InputParameterCheckable {
	private let validArgument: Bool
	private let validPoints: Bool
	
	init(validArgument: Bool, validPoints: Bool) {
		self.validArgument = validArgument
		self.validPoints = validPoints
	}
	
	func isValid(_ argument: String) -> Bool {
		return self.validArgument
	}
	
	func isValid(grid: Grid) -> Bool {
		return self.validPoints
	}
}

private final class MockParametersRetriever: InputParameterRetrievable {
	func grid(from argument: String) -> Grid {
		return Grid(rows: 0,columns: 0, pendingPoints: [])
	}
}

private final class MockDeliverier: Deliverable {
	func deliver(in grid: Grid) {
	}
}

private final class MockOutput: Outputable {
	func write(_ message: String) {}
}
