import XCTest

import pizzabotTests

var tests = [XCTestCaseEntry]()
tests += pizzabotTests.allTests()
tests += InputParameterCheckerTests.allTests()
tests += InputParameterRetrieverTests.allTests()
tests += LoggerTests.allTests()
tests += GridTests.allTests()
tests += PointTests.allTests()
tests += MovementTests.allTests()
tests += DeliverierTests.allTests()
tests += PizzabotCoreTestsTests.allTests()
XCTMain(tests)
