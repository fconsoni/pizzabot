//
//  Grid.swift
//  
//
//  Created by Franco Consoni on 23/12/2020.
//

import Foundation
import FunctionalUtils

struct Grid {
	let rows: Int
	let columns: Int
	var pendingPoints: [Point]
	
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
}
