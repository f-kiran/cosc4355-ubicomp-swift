/*: [Previous](@previous)

 ## Functions
*/
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

//: [Next](@next) |
//: [Introduction](Introduction)
