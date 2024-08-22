/*: [Previous](@previous)

 ## Classes
*/
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

// Getters and Setters
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

//: [Next](@next) |
//: [Introduction](Introduction)
