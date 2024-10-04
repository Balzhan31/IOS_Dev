import Foundation

func isPalindrome(_ text: String) -> Bool{
    return text == String(text.reversed())
}
if let input = readLine(){
    if isPalindrome(input){
        print("yes")
    }else {
        print("no")
    }
}
