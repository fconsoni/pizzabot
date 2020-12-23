import PizzaboyCore
import Logger

do {
	try Pizzaboy().run()
} catch let error as PizzaboyError {
	Logger().log(error: error.description())
} catch {
	Logger().log(error: error.localizedDescription)
}
