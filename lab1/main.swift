import Foundation

//Step 1
var firstname: String = "Balzhan"
var lastname: String = "Bozbashayeva"
var age: Int = 19
var birthYear: Int = 2005
var isStudent: Bool = true
var height: Double = 1.64

let currentYear: Int = 2024
age = currentYear - birthYear

//Step2
var hobby: [String] = ["Hiking⛰️", "Reading📚", "Learning foreign languages🌏"]
var numberofHobbies: Int = hobby.count
var favoriteNumber: Int = 7
var ishobbyCreative: Bool = true
var favoriteFood: String = "Beshbarmak"
var favoriteseason: String = "Spring"

//Bonus task
var futureGoals: String = "In the future it doesn't matter what kind of job I do🙂, but I want to be a professional in my field🫶🏻"

//Step3
var lifeStory: String = "My name is \(firstname) \(lastname). I am \(age) years old, born in \(birthYear).I am  \(isStudent ? "a student" : "not a student"). I have the following hobbies: \(hobby).In total, I have \(numberofHobbies) hobbies which \(ishobbyCreative ? "are creative hobbies" : "are not creative hobbies") and my favorite number is \(favoriteNumber), and I love eating \(favoriteFood). My favorite season is \(favoriteseason).\(futureGoals)"

print(lifeStory)
