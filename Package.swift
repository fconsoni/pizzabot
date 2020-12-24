// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pizzabot",
    dependencies: [
		.package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0")
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "pizzabot",
            dependencies: [.target(name: "PizzabotCore"),
						   .target(name: "FunctionalUtils"),
						   .target(name: "Logger")]),
		.target(name: "PizzabotCore", dependencies: [.target(name: "Logger")]),
		.target(name: "FunctionalUtils"),
		.target(name: "Logger",
				dependencies: ["Rainbow"]),
        
		.testTarget(
            name: "pizzabotTests",
            dependencies: ["pizzabot"]),
		.testTarget(
			name: "LoggerTests",
			dependencies: ["Logger"]),
		.testTarget(
			name: "PizzabotCoreTests",
			dependencies: ["PizzabotCore",
						   "FunctionalUtils"]),
    ]
)
