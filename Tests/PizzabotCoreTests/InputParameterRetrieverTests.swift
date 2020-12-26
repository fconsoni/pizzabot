//
//  InputParameterRetrieverTests.swift
//  
//
//  Created by Franco Consoni on 25/12/2020.
//

import Foundation
import XCTest
@testable import PizzabotCore

final class InputParameterRetrieverTests: XCTestCase {
	private let retriever = InputParameterRetriever()
	
	func testThatParseGridAndPointsCorrectly() {
		let argument = "5x5 (1,1)"
		let rowsExpected = 5
		let columnsExpected = 5
		let pointExpected = [Point(x: 1, y: 1)]
		
		XCTAssertEqual(retriever.grid(from: argument).rows, rowsExpected)
		XCTAssertEqual(retriever.grid(from: argument).columns, columnsExpected)
		XCTAssertEqual(retriever.grid(from: argument).pendingPoints, pointExpected)
	}
	
	static var allTests = [
		("testThatParseGridAndPointsCorrectly", testThatParseGridAndPointsCorrectly)
	]
}
