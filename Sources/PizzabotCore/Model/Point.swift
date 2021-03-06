//
//  Point.swift
//  
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation
import FunctionalUtils

public struct Point: Equatable {
	let x: Int
	let y: Int
	
	func isValid() -> Bool {
		return self.x >= 0 && self.y >= 0
	}
	
	func distanceTo(_ otherPoint: Point) -> Float {
		return Point(x: otherPoint.x - self.x, y: otherPoint.y - self.y).module()
	}
	
	private func module() -> Float {
		return sqrt(x ** 2 + y ** 2)
	}
	
	//SCALA-based copy method
	func copy(x: Int? = .none, y: Int? = .none) -> Point {
		return Point(x: x.getOrElse(self.x),
					 y: y.getOrElse(self.y))
	}
}
