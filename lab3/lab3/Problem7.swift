import Foundation

func gradeCalculator(students: [String:Int]){
    let scores = Array(students.values)
    let total: Double = Double(scores.reduce(0, +))
    let average = total / Double(scores.count)
    let highScore = scores.max()
    let lowScore = scores.min()
    
    print("Average: \(average)")
    print("Highest: \(highScore ?? 0)")
    print("Lowest: \(String(describing: lowScore))")
    
    for(name, score) in students{
        let status = score >= Int(average) ? "above" : "below"
        print("\(name): \(score) (\(status) average)")
    }
}

var studentScores: [String: Int] = [
    "Wonstein": 100,
    "JoniJane": 88,
    "Scombler": 96,
    "Jansbob": 85,
    "Twlv": 90
]

gradeCalculator(students: studentScores)
