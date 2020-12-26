//
//  Grid.swift
//  
//
//  Created by Franco Consoni on 23/12/2020.
//

import Foundation
import FunctionalUtils

final class Grid {
	private let rows: Int
	private let columns: Int
	private var pendingPoints: [Point]
	
	init(rows: Int, columns: Int, pendingPoints: [Point]) {
		self.rows = rows
		self.columns = columns
		self.pendingPoints = pendingPoints
	}
	
	//MARK:- grid validation
	func isValid() -> Bool {
		return [validNumber(of: rows), validNumber(of: columns), pointsAreValid()].all()
	}
	
	private func validNumber(of dimension: Int) -> Bool {
		return dimension > 0
	}
	
	private func pointsAreValid() -> Bool {
		return self.pendingPoints.all(self.isIn) && self.pendingPoints.all(Point.isValid)
	}
	
	private func isIn(_ point: Point) -> Bool {
		return point.x <= self.columns && point.y <= self.rows
	}
	
	//MARK:- points managment
	func nearestPoint(to position: Point) -> Point? {
		return self.pendingPoints.sorted(by: { p1, p2 in p1.distanceTo(position) < p2.distanceTo(position) }).first
	}
	
	func visited(point: Point) {
		self.pendingPoints.firstIndex(of: point).onValue { index in
			self.pendingPoints.remove(at: index)
		}
	}
}
