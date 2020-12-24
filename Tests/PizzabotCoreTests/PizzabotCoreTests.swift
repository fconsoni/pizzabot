//
//  InputParameterCheckerTests.swift
//
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation
import XCTest
@testable import PizzabotCore

final class PizzabotCoreTests: XCTestCase {
	private func mockedConfig(allValid: Bool) -> PizzabotConfiguration {
		return PizzabotConfiguration(argumentChecker: MockInputChecker(validateAll: allValid),
									 parameterRetriever: MockParametersRetriever())
	}
	
	func testThatFailsWithLessArgumentsThatNeeded() {
		let arguments = ["unusedToolName"]
		let core = Pizzabot(config: mockedConfig(allValid: true), arguments: arguments)
		
		XCTAssertThrowsError(try core.run())
	}
	
	func testThatFailsWithBadFormattedArgument() {
		let arguments = ["unusedToolName", "badFormattedArgument"]
		let core = Pizzabot(config: mockedConfig(allValid: false), arguments: arguments)
		
		XCTAssertThrowsError(try core.run())
	}
	
	func testThatDoesntFailWithCorrectArguments() {
		let arguments = ["unusedToolName", "wellFormattedArgument"]
		let core = Pizzabot(config: mockedConfig(allValid: true), arguments: arguments)
		
		XCTAssertNoThrow(try core.run())
	}
	
	static var allTests = [
		("testThatFailsWithLessArgumentsThatNeeded", testThatFailsWithLessArgumentsThatNeeded),
		("testThatFailsWithBadFormattedArgument", testThatFailsWithBadFormattedArgument),
		("testThatFailsWithLessArgumentsThatNeeded", testThatFailsWithLessArgumentsThatNeeded),
	]
}

private final class MockInputChecker: InputParameterCheckable {
	private let allValid: Bool
	
	init(validateAll val: Bool) {
		self.allValid = val
	}
	
	func isValid(_ argument: String) -> Bool {
		return self.allValid
	}
	
	func areValid(_ points: [Point], in grid: Grid) -> Bool {
		return self.allValid
	}
}

private final class MockParametersRetriever: InputParameterRetrievable {
	func grid(from argument: String) -> Grid {
		return Grid(rows: 0,columns: 0)
	}
	
	func points(from argument: String) -> [Point] {
		return []
	}
}
