# pizzabot

#### Configuration

To run pizzabot, simply write _**./pizzabot**_ and the desired argument, for example: _**./pizzabot "5x5 (1,2) (3,4)"**_. 
The argument, as indicated, is one single String. Any other additional argument will be ignored.

This package can be re-built using the command _**swift build**_. Then, the executable will be in the folder _**.build/debug**_.
There's no difference between targets *debug* and *release*, so, it's up to you choose between them.

To run the tests, simply execute _**swift test**_.
In order to test different paths, you can add them into the _**DeliverierTests.swift**_ file.


#### Explanation

Command Line Tool made entirely in Swift. Xcode version 12.2.

_**main.swift**_ file serves as the entry point of the tool. All the real behaviour starts in the _**PizzabotCore.swift**_ class.

Followed Dependency Injection principle throughout the project, so all the components can be easily mocked for testing purposes.

The strategy followed to solve the grid problem, was looking to the optimal path: comparing the vectors modules (based on the current position), and choosing the smallest one.


#### Composition

There are three main components in the tool.

**Core**: serves as the flow coordinator of the tool. It receives the arguments, and then handle components coordination.
**Argument checker**: check the argument's amount and format.
**Deliverier**: serves as solver of the problem. It handle and remember the movements between the grid's points, then shows them.
