import XCTest

import pizzaboyTests

var tests = [XCTestCaseEntry]()
tests += pizzaboyTests.allTests()
tests += InputParameterCheckerTests.allTests()
XCTMain(tests)
