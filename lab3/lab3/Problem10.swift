import Foundation

func uniqueCharacter(_ text: String) -> Bool{
    var charSet = Set<Character>()
    
    for char in text {
        if charSet.contains(char){
            return false;
        }
        else{
            charSet.insert(char)
        }
    }
    
    return true;
}

let text1 = "Swift"
let text2 = "Mirani"

print(uniqueCharacter(text1))
print(uniqueCharacter(text2))

