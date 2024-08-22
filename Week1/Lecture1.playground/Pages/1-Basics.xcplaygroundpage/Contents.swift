/*: [Previous](@previous)

 ## Basics
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
//myVar = 50

// Constant declaration, immutable
let myConst = 40
//myConst = 50

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

line 5
"""
print(multiStrings)

// Array declaration
var myArrays = ["item1", "item2", "item3"]
print(myArrays)

// Accessing array elements by index
print(myArrays[2])

// Uncommenting below will cause an error because the index is out of bounds
// print(myArrays[3])

// Modifying an array element
myArrays[0] = "item0"

// Dictionary declaration
var myDict = [
    "key0": "value0",
    "key1": "value1",
    "key2": "value2",
]


// Forced unwrapping of an optional value (unsafe if nil)
print(myDict["key1"])

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

//: [Next](@next)
