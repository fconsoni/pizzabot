import XCTest
import class Foundation.Bundle

final class pizzabotTests: XCTestCase {
	private var productsDirectory: URL {
		#if os(macOS)
		for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
			return bundle.bundleURL.deletingLastPathComponent()
		}
		fatalError("couldn't find the products directory")
		#else
		return Bundle.main.bundleURL
		#endif
	}
	
	func testThatRunCorrectlyWithCorrectArgument() throws {
        guard #available(macOS 10.13, *) else {
            return
        }

        let pizzabot = productsDirectory.appendingPathComponent("pizzabot")

        let process = Process()
		process.arguments = ["unused", "5x5 (1,2) (3,4)"]
        process.executableURL = pizzabot

        XCTAssertNoThrow(try process.run())
    }
    

    static var allTests = [
        ("testThatRunCorrectlyWithCorrectArgument", testThatRunCorrectlyWithCorrectArgument),
    ]
}
