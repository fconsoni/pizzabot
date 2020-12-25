//
//  PizzabotDeliverier.swift
//  
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation
import FunctionalUtils
import Logger

protocol Deliverable {
	func deliver(in grid: Grid)
}

final class PizzabotDeliverier: Deliverable {
	private var currentPosition: Point
	private var pendingPoints: [Point]
	private var movements: [Movement]
	private var logger: Logger
	
	init(logger: Logger) {
		self.currentPosition = Point(x: 0, y: 0)
		self.pendingPoints = []
		self.movements = []
		self.logger = logger
	}
	
	func deliver(in grid: Grid) {
		self.pendingPoints = grid.pendingPoints
		
		self.chooseNextPoint(in: grid)
	}
	
	private func chooseNextPoint(in grid: Grid) {
		if let nearestPoint = self.pendingPoints.sorted(by: { p1, p2 in p1.distanceTo(currentPosition) < p2.distanceTo(currentPosition) }).first {
			self.logger.log(message: "Moving to: (\(nearestPoint.x), \(nearestPoint.y))")
			self.moveTo(nearestPoint)
			
			self.chooseNextPoint(in: grid)
		} else {
			self.logger.log(success: "Delivery completed successfully!")
			self.logger.log(success: self.movements.map(Movement.code).joined())
		}
	}
	
	private func moveTo(_ nearestPoint: Point) {
		let needsToMoveTo: (Movement) -> Bool = curry(self.needsToMove)(nearestPoint)
		
		Movement.allCases.first(where: needsToMoveTo).onValue { movement in
			self.updateCurrentPosition(movingTo: movement)
			self.movements.append(movement)
			
			if movement != .drop {
				self.moveTo(nearestPoint)
			} else {
				self.pendingPoints.firstIndex(of: nearestPoint).onValue { index in
					self.pendingPoints.remove(at: index)
				}
			}
		}
	}
	
	private func needsToMove(to point: Point, inDirection direction: Movement) -> Bool {
		switch direction {
		case .north:
			return point.y > self.currentPosition.y
		case .east:
			return point.x > self.currentPosition.x
		case .south:
			return point.y < self.currentPosition.y
		case .west:
			return point.x < self.currentPosition.x
		case .drop:
			return point.x == self.currentPosition.x && point.y == self.currentPosition.y
		}
	}
	
	private func updateCurrentPosition(movingTo direction: Movement) {
		switch direction {
		case .north:
			self.currentPosition = self.currentPosition.copy(y: self.currentPosition.y + 1)
		case .east:
			self.currentPosition = self.currentPosition.copy(x: self.currentPosition.x + 1)
		case .south:
			self.currentPosition = self.currentPosition.copy(y: self.currentPosition.y - 1)
		case .west:
			self.currentPosition = self.currentPosition.copy(x: self.currentPosition.x - 1)
		case .drop:
			break
		}
	}
}

//Haskell-based composition operator, read in the same direction (from right to left)
infix operator <<: CompositionPrecedence
