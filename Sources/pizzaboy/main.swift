import PizzaboyCore
import Logger

do {
	try Pizzaboy().run()
} catch PizzaboyError.missingParameter {
	Logger().log(error: PizzaboyError.missingParameter.description())
} catch PizzaboyError.invalid(argument: let argument) {
	Logger().log(error: argument)
}
