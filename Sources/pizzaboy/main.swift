import PizzaboyCore
import Rainbow

do {
	try Pizzaboy().run()
} catch PizzaboyError.missingParameter {
	print("Error. ".red + "Trying to execute without all parameters needed")
} catch PizzaboyError.invalidArgument(argument: let argument) {
	print("Error. ".red + "Invalid argument format in: \(argument)")
}
