// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pizzaboy",
    dependencies: [
		.package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0")
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "pizzaboy",
            dependencies: [.target(name: "PizzaboyCore"),
						   .target(name: "FunctionalUtils"),
						   .target(name: "Logger")]),
		.target(name: "PizzaboyCore", dependencies: [.target(name: "Logger")]),
		.target(name: "FunctionalUtils"),
		.target(name: "Logger",
				dependencies: ["Rainbow"]),
        
		.testTarget(
            name: "pizzaboyTests",
            dependencies: ["pizzaboy"]),
		.testTarget(
			name: "PizzabotCoreTests",
			dependencies: ["PizzaboyCore",
						   "FunctionalUtils"]),
    ]
)
