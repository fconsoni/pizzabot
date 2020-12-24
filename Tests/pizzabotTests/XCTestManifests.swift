import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(pizzabotTests.allTests),
		testCase(InputParameterCheckerTests.allTests),
    ]
}
#endif
