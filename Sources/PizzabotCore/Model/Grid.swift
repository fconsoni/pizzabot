//
//  Grid.swift
//  
//
//  Created by Franco Consoni on 23/12/2020.
//

import Foundation

struct Grid {
	let rows: Int
	let columns: Int
	
	func isIn(_ point: Point) -> Bool {
		return point.x <= self.columns && point.y <= self.rows
	}
	
	func isValid() -> Bool {
		return self.rows > 0 && self.columns > 0
	}
}
