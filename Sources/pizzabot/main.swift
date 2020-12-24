import PizzabotCore
import Logger

do {
	try Pizzabot().run()
} catch let error as PizzabotError {
	Logger().log(error: error.description())
} catch {
	Logger().log(error: error.localizedDescription)
}
