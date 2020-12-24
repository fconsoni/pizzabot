//
//  ArgumentSplitter.swift
//  
//
//  Created by Franco Consoni on 24/12/2020.
//

import Foundation

protocol ArgumentSplittable {
	func components(of argument: String) -> [String]
}

extension ArgumentSplittable {
	func components(of argument: String) -> [String] {
		let trimmedComponents = argument.separateBy("(").map{ $0.trim() }
		
		return trimmedComponents.take(1) + trimmedComponents.tail().map{ "(\($0)" }
	}
}
