//
//  Point.swift
//  
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation

struct Point {
	let x: Int
	let y: Int
	
	func distanceTo(_ otherPoint: Point) -> Float {
		return abs(self.module() - otherPoint.module())
	}
	
	private func module() -> Float {
		return sqrt(Float(x^2 + y^2))
	}
}
