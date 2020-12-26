import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(pizzabotTests.allTests),
		testCase(InputParameterCheckerTests.allTests),
		testCase(InputParameterRetrieverTests.allTests),
		testCase(LoggerTests.allTests),
		testCase(GridTests.allTests),
		testCase(PointTests.allTests),
		testCase(MovementTests.allTests),
		testCase(DeliverierTests.allTests),
		testCase(PizzabotCoreTestsTests.allTests),
    ]
}
#endif
