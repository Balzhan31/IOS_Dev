import Foundation

func isPalindrome(_ text: String) -> Bool{
    let cleanedText = text.lowercased().filter{ $0.isLetter }
    
    return cleanedText == String(cleanedText.reversed())
}
