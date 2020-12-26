//
//  GridTests.swift
//  
//
//  Created by Franco Consoni on 25/12/2020.
//

import Foundation
import XCTest
@testable import PizzabotCore

final class GridTests: XCTestCase {
	func testThatValidGridWithValidPointsIsValid() {
		let points = [Point(x: 1, y: 2)]
		
		XCTAssertTrue(Grid(rows: 2, columns: 2, pendingPoints: points).isValid())
	}
	
	func testThatValidGridWithInvalidPointsIsNotValid() {
		let points = [Point(x: 3, y: 2)]
		
		XCTAssertFalse(Grid(rows: 2, columns: 2, pendingPoints: points).isValid())
	}
	
	func testThatInvalidGridWithValidPointsIsNotValid() {
		let points = [Point(x: 1, y: 2)]
		
		XCTAssertFalse(Grid(rows: -1, columns: 2, pendingPoints: points).isValid())
	}
	
	func testThatInvalidGridWithInvalidPointsIsNotValid() {
		let points = [Point(x: -3, y: -2)]
		
		XCTAssertFalse(Grid(rows: -2, columns: -2, pendingPoints: points).isValid())
	}
	
	func testThatNearestPointIsCorrect() {
		let currentPosition = Point(x: 0, y: 0)
		let points = [Point(x: 1, y: 1), Point(x: 3, y: 3)]
		
		XCTAssertEqual(Grid(rows: 5, columns: 5, pendingPoints: points).nearestPoint(to: currentPosition), Point(x: 1, y: 1))
	}
	
	func testThatNearestPointWithoutMorePendingPointsisEmpty() {
		XCTAssertNil(Grid(rows: 1, columns: 1, pendingPoints: []).nearestPoint(to: Point(x: 0, y: 0)))
	}
	
	func testThatVisitPointsCorrectly() {
		let visitedPoint = Point(x: 1, y: 1)
		let otherPoint = Point(x: 3, y: 3)
		let points = [visitedPoint, otherPoint]
		let grid = Grid(rows: 5, columns: 5, pendingPoints: points)
		
		grid.visited(point: visitedPoint)
		
		XCTAssertEqual(grid.nearestPoint(to: visitedPoint), otherPoint)
	}
	
	static var allTests = [
		("testThatValidGridWithValidPointsIsValid", testThatValidGridWithValidPointsIsValid),
		("testThatValidGridWithInvalidPointsIsNotValid", testThatValidGridWithInvalidPointsIsNotValid),
		("testThatInvalidGridWithValidPointsIsNotValid", testThatInvalidGridWithValidPointsIsNotValid),
		("testThatInvalidGridWithInvalidPointsIsNotValid", testThatInvalidGridWithInvalidPointsIsNotValid),
		("testThatNearestPointIsCorrect", testThatNearestPointIsCorrect),
		("testThatNearestPointWithoutMorePendingPointsisEmpty", testThatNearestPointWithoutMorePendingPointsisEmpty),
		("testThatVisitPointsCorrectly", testThatVisitPointsCorrectly)
	]
}
