//: Playground - noun: a place where people can play
//Derek Yu

import UIKit

var str = "Hello, playground"
str = "Hello, Swift"
let constStr = str

//constStr = "Hello World"

var nextYear: Int
var bodyTemp: Float
var hasPeet: Bool

//var arrayOfInts: Array<Int>
var arrayOfInts:[Int]

//var dictionaryOfCapitalsByCountry: Dictionary<String, String>
var dictionaryOfCapitalsByCountry: [String:String]

var winningLotteryNumbers:Set<Int>


let number = 42
let fmStation = 91.1

//let countingUp = ["one", "two"]
var countingUp = ["one", "two"]
let nameByParkingSpace = [13:"Alice", 27:"Bob"]
let secondElement = countingUp[1]


let emptyString = String()
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

let meaningOfLife = String(number)

let availableRooms = Set([205, 411, 412])

let defaultFloat = Float()

let floatFromLiteral = Float(3.14)

let easyPi = 3.14

let floatFromDouble = Float(easyPi)

let floatingPi: Float = 3.14


countingUp.count

let empyString = ""
emptyString.isEmpty

countingUp.append("three")

var anOptionalFloat: Float?

var anOptionalArrayOfStrings: [String]?

var anOptionalArrayOfOptionalStrings: [String?]?


var reading1:Float?
var reading2:Float?
var reading3:Float?

reading1 = 9.8
reading2 = 9.2
//reading3 = 9.7
//let avgReading = (reading1 + reading2 + reading3)/3
//let avgReading = (reading1! + reading2! + reading3!)/3

if let r1  = reading1, r2 = reading2, r3 = reading3{
    let avgReading = (r1 + r2 + r3)/3
    
} else{
    let errorString = "Instrument reported a reading that was nil"
}

//let space13Assignee: String? = nameByParkingSpace[13]

let space42Assignee: String? = nameByParkingSpace[42]

if let space13Assignee = nameByParkingSpace[13]{
    print("Key 13 is assigned in the dictionary")
}


for var i = 0; i < countingUp.count; ++i {
    let string = countingUp[i]
    //UseString
}

let range = 0..<countingUp.count
for i in range {
    let string = countingUp[i]
    //Use String
}

for string in countingUp{
    //Use String
}

for (i, string) in countingUp.enumerate(){
    
}

for (space, name) in nameByParkingSpace {
    let permit = "Space \(space):\(name)"
    print(permit)
}

//
//enum PieType {
//    case Apple
//    case Cherry
//    case Pecan
//}

//let favoritePie = PieType.Apple
//
//let name:String
//switch favoritePie{
//case .Apple:
//    name = "Apple"
//case .Cherry:
//    name = "Cherry"
//    
//case .Pecan:
//    name = "Pecan"
//}

let osxVersion: Int = 10;

switch osxVersion {
case 0...8:
    print("A big cat")
    
case 9:
    print("Mavericks")
case 10:
    print("Yosemite")
default:
    print("Greetings, people of the future! What's new in 10.\(osxVersion)?")

}

enum PieType: Int{
    case Apple = 0
    case Cherry
    case Pecan
}

let pieRawValue = PieType.Pecan.rawValue

if let pieType = PieType(rawValue: pieRawValue){
    //Got a valid 'pieType
    print("got valid type")
}


