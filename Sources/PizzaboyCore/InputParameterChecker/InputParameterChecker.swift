//
//  InputParameterChecker.swift
//  
//
//  Created by Franco Consoni on 23/12/2020.
//

import Foundation

protocol InputParameterCheckable {
	func isValid(_ argument: String) -> Bool
}

final class InputParameterChecker: InputParameterCheckable {
	func isValid(_ argument: String) -> Bool {
		
		return false
	}
}
