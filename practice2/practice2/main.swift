import Foundation
//1
var fruits: [String] = ["Apple", "Banana", "Blueberry", "Mango", "Cherry"]
let third = fruits[2]
print(third)

//2
var numbers: Set<Int> = [2, 4, 6, 8]
numbers.insert(12)
print(numbers)

//3
var Language = [
    "Swift": 2014,
    "Python": 1991,
    "Java": 1995
]
if let relizYear = Language["Swift"]{
    print("Swift released in \(relizYear)")
}

//4
var colors: [String] = ["red", "blue", "green", "yellow"]
colors[1] = "lavander"
print("Updated colors is \(colors)")

//5
var set1: Set = [1, 2, 3, 4]
var set2: Set = [5, 6, 7, 8]
let union = set1.union(set2)
print("Intersection of the two sets \(union)")

//6
var Students = [
    "Erkeboolean": 96,
    "Jansbob": 98,
    "Kamimimila": 99
]
Students["Jansbob"] = 95
print("New Score \(Students)")

//7
var arr1: [String] = ["apple", "banana"]
var arr2: [String] = ["cherry", "date"]
let merge = arr1 + arr2
print(merge.joined(separator:", "))

//8
var country = [
    "Kazakhstan": 19,
    "South Korea": 50,
    "USA":331
]
country["Saudi Arabia"] = 36
print(country)

//9
var seta: Set = ["cat", "dog"]
var setb: Set = ["dog", "mouse"]
let unionn = seta.union(setb)
let sub = unionn.subtracting(setb)
print(sub)

//10
var students: [String: [Int]] = [
    "Erkeboolean": [96, 83, 88],
    "Jansbob": [92, 87, 89],
    "Kamimimila": [99, 98, 97]
]
let student = "Kamimimila"
if let secondgrade = students[student]?[1] {
    print("\(student)'s second grade \(secondgrade)")
}
