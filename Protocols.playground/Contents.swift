import UIKit

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
var human4 = Human()
var human5 = Human()

human3.name = "John Doe"
human4.name = "Weird Al"
human5.name = "Horse"
human3.age = 17
human4.age = 20
human5.age = 30

var humanArray = [Human]()

humanArray = [human1, human2, human3, human4, human5]
var sortedPeople = humanArray.sorted()

print(sortedPeople.description)


//==============================================================

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

//==============================================================

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


//==============================================================

//protocol Transformation {
//    mutating func transform()
//}
//
//enum SuperHero: Transformation, Comparable {
//    static func < (lhs: SuperHero, rhs: SuperHero) -> Bool {
////        return lhs.hulk == rhs.hulk && lhs.hulk == rhs.hulk
//    }
//
//    case hulk
//    case notHulk
//    func transform() {
//}
//}
//        if SuperHero.self != SuperHero.hulk {
//            print("I am not the Hulk")
//        } else {
//            print("Ok, I am upset enough to be the Hulk")
//        }
//
//var bruceBanner = SuperHero.notHulk
//bruceBanner.transform()

//==============================================================

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


