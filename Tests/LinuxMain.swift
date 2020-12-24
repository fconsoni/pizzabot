import XCTest

import pizzabotTests

var tests = [XCTestCaseEntry]()
tests += pizzabotTests.allTests()
tests += InputParameterCheckerTests.allTests()
XCTMain(tests)
