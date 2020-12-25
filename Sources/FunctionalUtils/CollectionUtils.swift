//
//  CollectionUtils.swift
//  
//
//  Created by Franco Consoni on 22/12/2020.
//

import Foundation

extension Sequence {
	public func map<T>(_ fx: (Element) -> () -> T) -> [T] {
		return lazy.map(fx).map{ $0() }
	}
	
	public func filter(_ fx: (Element) -> () -> Bool) -> [Element] {
		return lazy.filter{ fx($0)() }
	}
}

extension Sequence {
	public func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
		return lazy.map{ $0[keyPath: keyPath] }
	}
	
	public func flatMap<T>(_ keyPath: KeyPath<Element, [T]>) -> [T] {
		return flatMap{ $0[keyPath: keyPath] }
	}
	
	public func filter(_ keyPath: KeyPath<Element, Bool>) -> [Element] {
		return lazy.filter{ $0[keyPath: keyPath] }
	}
	
	public func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
		return sorted { a, b in
			return a[keyPath: keyPath] < b[keyPath: keyPath]
		}
	}
	
	public func sortedReversed<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
		return self.sorted(by: keyPath).reversed()
	}
}

extension Collection {
	subscript(safe index: Index) -> Element? {
		return indices.contains(index) ? self[index] : nil
	}
	
	public func all(_ condition: (Element) -> Bool) -> Bool {
		return self.lazy.allSatisfy(condition)
	}
	
	public func all(_ condition: (Element) -> () -> Bool) -> Bool {
		return self.lazy.map(condition).allSatisfy{ $0() }
	}
	
	public func any(_ predicate: (Element) -> Bool)  -> Bool {
		return self.filter(predicate).count > 0
	}
}

extension Collection where Element: AdditiveArithmetic {
	public func sum() -> Element {
		return self.lazy.reduce(.zero, +)
	}
}

extension Collection where Element == Bool {
	public func all() -> Bool {
		return self.lazy.allSatisfy{ $0 }
	}
}

extension Array {
	public func take(_ number: Int) -> [Element] {
		let index = Swift.min(number, self.count)
		return Array(self.prefix(through: index - 1))
	}
	
	public func tail() -> [Element] {
		if self.isEmpty {
			return []
		} else {
			return Array(self.suffix(self.count - 1))
		}
	}
	
	public func drop(_ number: Int) -> Array {
		return Array(self.dropLast(number))
	}
	
	public func appending(_ element: Element) -> [Element] {
		var copy = self
		copy.append(element)
		
		return copy
	}
	
	public func flatten<T>() -> [T] where Element == T? {
		return self.compactMap(identity)
	}
	
	public func without(_ element: Element) -> [Element] where Element: Equatable {
		return self.filter(not << equalTo(element))
	}
}

extension Dictionary where Key == String {
	public func removing(key: String) -> Dictionary<Key, Value> {
		return self.filter{ k,_ in key != k }
	}
}

extension String {
	public func lines() -> [String] {
		return separateBy("\n")
	}
	
	public func words() -> [String] {
		return separateBy(" ")
	}
	
	public func separateBy(_ separator: String) -> [String] {
		return self.components(separatedBy: CharacterSet(charactersIn: separator))
	}
	
	public func trim() -> String {
		return self.trimmingCharacters(in: CharacterSet.whitespaces)
	}
	
	public func take(_ number: Int) -> String {
		let index = Swift.min(number, self.count)
		return String(self.prefix(index))
	}
	
	public func tail() -> String {
		if self.isEmpty {
			return ""
		} else {
			return String(self.suffix(self.count - 1))
		}
	}
	
	public func drop(_ number: Int) -> String {
		return String(self.dropLast(number))
	}
}

public func +<A>(_ dictionary: [A: Any], _ otherDictionary: [A: Any]) -> [A: Any] {
	return dictionary.merging(otherDictionary, uniquingKeysWith: { v1, v2 in v1 })
}

infix operator ++ : AdditionPrecedence
public func ++<A>(_ array: [A], _ element: A) -> [A] {
	return array.appending(element)
}
