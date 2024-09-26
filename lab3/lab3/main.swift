import Foundation

func isPrime(number: Int) ->Bool {
    if number <= 1 {
        return false
    }
    if number == 2 {
        return true
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true;
}

for number in 1...100 {
    if isPrime(number: number){
        print(number, terminator:" ")
    }
}

