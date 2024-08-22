//
//  Lecture1.swift
//  playground
//
//  Created by Fettah KIRAN on 8/21/24.
//


// Materials used:
// 1. https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html
// 2. https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html
// 3. https://www.hackingwithswift.com/read/0/14/enumerations

/*
What is Swift?

By Wiki: General-purpose, multi-paradigm, compiled programming language developed by Apple Inc
We may add: Turing complete language.
Can be used to develop hello world apps or fully func OS
 */

import Foundation

// This is a single-line comment
// print("Hello, World!") // Uncomment to print Hello, World!

/*
 This is a multi-line comment
 print("hi") // Uncomment to print hi
*/

// Variable declaration, mutable
var myVar = 40

// Constant declaration, immutable
let myConst = 40

// Explicit type declaration
let explicitConst: Double = 5.4
print(explicitConst)

// String concatenation
let label = "len is"
let length = 50

let fullText = label + String(length)
print(fullText)

// Multi-line string literal
let multiStrings = """
line 2
line 3
line 4
"""
print(multiStrings)

// Array declaration
var myArrays = ["item1", "item2", "item3"]
print(myArrays)

// Accessing array elements by index
print(myArrays[2])

// Uncommenting below will cause an error because the index is out of bounds
// print(myArrays[3])

// Dictionary declaration
var myDict = [
    "key0": "value0",
    "key1": "value1",
    "key2": "value2",
]

// Modifying an array element
myArrays[0] = "item0"

// Forced unwrapping of an optional value (unsafe if nil)
print(myDict["key1"]!)

// Uncommenting below will cause a runtime error due to forced unwrapping of nil
// print(myDict["key3"]!)

var emptyArr: [String] = [] // Empty array
var emptyDict: [String: Int] = [:] // Empty dictionary

var totalThirdItems = 0

// Iterating over array elements
for item in myArrays {
    if item == "item3" {
        totalThirdItems += 2
    } else {
        print("Item is not 3!")
    }
}

print(totalThirdItems)

// Optional String declaration
var myOpString: String?

// Uncommenting below will cause a runtime error if myOpString is nil
// print(myOpString!)

// Check if the optional is nil
print(myOpString == nil)

var myOpString2: String? = "Test"

// Optional binding using if-let
if let myName = myOpString {
    myOpString2 = "Second Opt: \(myName)"
}

print(myOpString2!)

let nickName: String? = nil
let fullName: String = "First"
let greetings = "Hi, \(nickName ?? fullName)!" // nickName is nil, so prints "Hi, nil!"
print(greetings)

let vegetables = "red pepper"
var out: String? = nil

// Switch-case statement with pattern matching
switch vegetables {
case "celery":
    print("I don't like")
    out = "1"
case "cucumber", "tomato":
    print("not bad")
    out = "2"
case let x where x.hasSuffix("pepper"):
    print("is it spicy \(x)")
    out = "3 \(x)"
    print(out!)
default:
    print("Default print")
}

// Function declaration and usage
func greet(person: String, day: String) -> String {
    return "Greeting \(person) today is \(day)"
}

print(greet(person: "Bob", day: "Monday"))

func calcStats(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    // Loop to calculate min, max, and sum of scores
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let statistics = calcStats(scores: [5, 3, 1, 100, 21])
print(statistics.sum)
print(statistics.0)
print(statistics.2)

// // Nested functions - Not much useful
// func returnFifteen() -> Int {
//     var y = 10
//     func add(){
//         y += 5
//     }
//     add()
//     return y
// }

// print(returnFifteen())

// Closure usage in Swift

var numbers = [20, 19, 7, 12]

// Using map function with full closure syntax
var output = numbers.map(
    { (number: Int) -> Int in
        let result = 3 * number
        return result
    }
)
print(output)

// Using map function with simplified closure syntax
let mappedNumbers = numbers.map { number in 3 * number }
print(mappedNumbers)

// Sorting using closure
let sorted = numbers.sorted { $0 < $1 }
print(sorted)

// Class definition
class Shape {
    var nSides = 7
    func simpleDesc() -> String {
        return "A shape with \(nSides) sides"
    }
}

var shape = Shape()
shape.nSides = 7
var shapeDesc = shape.simpleDesc()
print(shapeDesc)

// Inheritance and method overriding
class NamedShape {
    var nSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDesc() -> String {
        return "A shape with \(nSides) sides"
    }
}

class Square: NamedShape {
    var sLength: Double
    
    init(sLength: Double, name: String) {
        self.sLength = sLength
        super.init(name: name)
        nSides = 4
    }
    
    func area() -> Double {
        return sLength * sLength
    }
    
    override func simpleDesc() -> String {
        return "A square with side length \(sLength) sides"
    }
}

let test = Square(sLength: 5.5, name: "test5.2")
print(test.area())
print(test.simpleDesc())

// // Getters and Setters

class EquilateralTriangle: NamedShape {
    
    var sLength: Double = 0.0
    
    init(sLength: Double, name: String) {
        self.sLength = sLength
        super.init(name: name)
        nSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sLength
        }
        set {
            sLength = newValue / 3.0
        }
    }
    
    override func simpleDesc() -> String {
        return "An equilateral triangle with sides of \(sLength)"
    }
}

var triangle = EquilateralTriangle(sLength: 3.1, name: "a triangle")
print(triangle.perimeter) // Prints "9.3"

triangle.perimeter = 9.9
print(triangle.sLength) // Prints "3.3000000000000003"

// Enumerations and optional usage

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

// string could be a bad choice for that type of data (categorical variable)
// we may solve the problem using enum

enum WeatherType {
    case sun, cloud, rain, wind, snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    if weather == WeatherType.sun {
        return nil // Have you used optional!!
    } else {
        return "Hate"
    }
}

print(getHaterStatus(weather: WeatherType.cloud))

// Swift optionals are implemented using enums with associated values.
// two cases: none and some where some having whatever value is inside the optional

func knockknock(_ caller: String?) {
    print("Who's there?")
    switch caller {
    case .none:
        print("* silence *")
    case .some(let person):
        print(person)
    }
}

knockknock(nil)
knockknock("Bob")
