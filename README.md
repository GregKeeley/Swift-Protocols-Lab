
## Protocols Lab

## Instructions for lab submission

1. Fork the assignment repo
1. Clone your Fork to your machine
1. Complete the lab
1. Push your changes to your Fork
1. Submit a Pull Request back to the assignment repo
1. Paste a link of the pull request on Canvas and submit


<br>

> Questions adapted from [Swift student lessons: 4 - Tables and Persistence -> 1 - Protocols](https://developer.apple.com/go/?id=app-dev-swift-student)

## Question 1

a. Create a `Human` class with two properties:
- `name` of type String
- `age` of type Int.

Then create an initializer for the class and create two `Human` instances.

b. Make the `Human` class adopt the CustomStringConvertible protocol. Then print both of your previously initialized
`Human` objects.

c. Make the `Human` class adopt the Equatable protocol. Two instances of `Human` should be considered equal
if their names and ages are identical to one another. Print the result of a boolean expression
evaluating whether or not your two previously initialized `Human` objects are equal to eachother
(using ==). Then print the result of a boolean expression evaluating whether or not your two
previously initialized `Human` objects are not equal to eachother (using !=).

d. Make the `Human` class adopt the `Comparable` protocol. One `Human` is greater than another `Human` if its age is bigger. Create another
three instances of a `Human`, then create an array called people of type [`Human`] with all of the
`Human` objects that you have initialized.

Create a new array called sortedPeople of type [`Human`] that is the people array sorted by age.

</br> </br>
Answer
```swift
class Human: CustomStringConvertible, Equatable, Comparable {
    static func < (lhs: Human, rhs: Human) -> Bool {
        return lhs.age < rhs.age
    }
    static func > (lhs: Human, rhs: Human) -> Bool {
        return lhs.age > rhs.age
    }
    static func == (lhs: Human, rhs: Human) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    var name = String()
    var age = Int()
    var description: String = "Hello, I am"
}

var human1 = Human()
human1.name = "Hue Man"
human1.age = 18

var human2 = Human()
human2.name = "Lae Dee"
human2.age = 19

print(human1.description, human2.description)

if human1 == human2 {
    print("These humans are the same human")
} else {
    print("These humans are not equal to each other")
}

var human3 = Human()
human3.name = "John Doe"
human3.age = 17

var human4 = Human()
human4.name = "Weird Al"
human4.age = 20

var human5 = Human()
human5.name = "Horse"
human5.age = 30

var humanArray = [Human]()

humanArray = [human1, human2, human3, human4, human5]
var sortedPeople = humanArray.sorted()
```

## Question 2

a. Create a protocol called `Vehicle` with two requirements:
- a nonsettable `numberOfWheels` property of type Int,
- a function called drive().

b. Define a `Car` struct that implements the `Vehicle` protocol. `numberOfWheels` should return a value of 4,
and drive() should print "Vroom, vroom!" Create an instance of `Car`, print its number of wheels,
then call drive().

c. Define a Bike struct that implements the `Vehicle` protocol. `numberOfWheels` should return a value of 2,
and drive() should print "Begin pedaling!". Create an instance of Bike, print its number of wheels,
then call drive().

</br> </br>
Answer
```swift 
protocol Vehicle {
    var numberOfWheels: Int { get set }
    func drive()
}

struct Car: Vehicle {
    var numberOfWheels = 4
    
    func drive() {
    print("Vroom Vroom")
    }
}

var car1 = Car()
car1.numberOfWheels = 4
print("car1 var has \(car1.numberOfWheels) wheels")
car1.drive()

struct Bicycle: Vehicle {
    var numberOfWheels = 2
    func drive() {
        print("Begin Pedaling!")
    }
}

var myBike = Bicycle()
print("myBike happens to have exactly \(myBike.numberOfWheels)")
myBike.drive()

```

## Question 3
// Given the below two protocols, create a struct for penguin(a flightless bird) and an eagle.

Give your structs some properties and have them conform to the appropriate protocols.

```swift
protocol Bird {
 var name: String { get }
 var canFly: Bool { get }
}

protocol Flyable {
 var airspeedVelocity: Double { get }
}
```

</br> </br>
Answer
```swift
protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}

protocol Flyable {
    var airspeedVelocity: Double { get }
}

struct Penguin: Bird, Flyable {
    var name = "Penguin"
    var canFly = false
    var airspeedVelocity = 0.0
}

struct Eagle: Bird, Flyable {
    var name = "Eagle"
    var canFly = true
    var airspeedVelocity = 30.0
}
```
## Question 4

a. Create a protocol called `Transformation`.  The protocol should specify a mutating method called transform

b. Make an enum called `SuperHero` that conforms to `Transformation` with cases `notHulk` and `hulk`

c. Create an instance of it named `bruceBanner`. Make it so that when the transform function is called that bruceBanner turns from
`.notHulk` to `.hulk.``

```swift
enum SuperHero: Transformation {
    // write code here.
}

// Example Output:
var bruceBanner = SuperHero.notHulk

bruceBanner.transform() . // hulk

bruceBanner.transform()  // notHulk
```

</br> </br>
Answer (incomplete)
```swift 
protocol Transformation {
    mutating func transform()
}

enum SuperHero: Transformation, Comparable {
    static func < (lhs: SuperHero, rhs: SuperHero) -> Bool {
//        return lhs.hulk == rhs.hulk && lhs.hulk == rhs.hulk
    }
    
    case hulk
    case notHulk
    func transform() {
}
}
        if SuperHero.self != SuperHero.hulk {
            print("I am not the Hulk")
        } else {
            print("Ok, I am upset enough to be the Hulk")
        }

var bruceBanner = SuperHero.notHulk
bruceBanner.transform()
```

## Question 5

a. Create a protocol called `Communication`

b. Give it a property called `message`, of type String, and assign it an explicit getter.

c. Create three Classes. `Cow`, `Dog`, `Cat`.

d. Have your three classes conform to `Communication`

e. `message` should return a unique message for each animal when talk is called.

f. Put an instance of each of your classes in an array.

g. Iterate over the array and have them print their `message` property

</br> </br>
Answer (incomplete)
```swift
protocol Communication {
    var message: String { get }
    
}

class Cow: Communication {
    var message: String = "Moo"
    
}
class Dog: Communication {
    var message: String = "Bark"
    
}
class Cat: Communication {
    var message: String = "Meow"
    
}

var cat1 = Cat()
var dog1 = Dog()
var cow1 = Cow()

var animalArray: Any = [cat1, dog1, cow1]

```

## Question 6

The HeartRateReceiver class below represents a very simplified example of a class dedicated to receiving information from fitness tracking hardware with monitoring heart rate. The function startHeartRateMonitoringExample will generate random heart rates and assign them to currentHR, simulating how an instance of HeartRateReceiver may pick up on new heart rate readings at specific intervals.

HeartRateViewController below is a view controller that will present the heart rate information to the user. Throughout the exercises below you'll use the delegate pattern to pass information from an instance of HeartRateReceiver to the view controller so that anytime new information is obtained it is presented to the user.

```swift
class HeartRateReceiver {
    var currentHR: Int? {
        didSet {
            if let currentHR = currentHR {
                print("The most recent heart rate reading is \(currentHR).")
            } else {
                print("Looks like we can't pick up a heart rate.")
            }
        }
    }

    func startHeartRateMonitoringExample() {
        for _ in 1...10 {
            let randomHR = 60 + Int.random(in: 0...15)
            currentHR = randomHR
            Thread.sleep(forTimeInterval: 2)
        }
    }
}

class HeartRateViewController: UIViewController {
    var heartRateLabel: UILabel = UILabel()
}
```

First, create an instance of HeartRateReceiver and call startHeartRateMonitoringExample. Notice that every two seconds currentHR get set and prints the new heart rate reading to the console.

In a real app, printing to the console does not show information to the user. You need a way of passing information from the HeartRateReceiver to the HeartRateViewController. To do this, create a protocol called HeartRateReceiverDelegate that requires a method heartRateUpdated(to bpm:) where bpm is of type Int and represents the new rate as beats per minute. Since playgrounds read from top to bottom and the two previously declared classes will need to use this protocol, you'll need to declare this protocol above the declaration of HeartRateReceiver.

Now make HeartRateViewController adopt the protocol you've just created. Inside the body of the required method you should set the text of heartRateLabel and print "The user has been shown a heart rate of <INSERT HEART RATE HERE>."

Now add a property called delegate to HeartRateReceiver that is of type HeartRateReceiverDelegate?. In the didSet of currentHR where currentHR is successfully unwrapped, call heartRateUpdated(to bpm:) on the delegate property.

Finally, return to the line of code just after you initialized an instance of HeartRateReceiver. Initialize an instance of HeartRateViewController. Then, set the delegate property of your instance of HeartRateReceiver to be the instance of HeartRateViewController that you just created. Wait for your code to compile and observe what is printed to the console. Every time that currentHR gets set, you should see both a printout of the most recent heart rate, and the print statement stating that the heart rate was shown to the user.
