import Foundation

func CeltoFah(_ celsius: Double) -> Double{
    return(celsius * 9/5) + 32
}
func CeltoKel(_ celsius: Double) -> Double{
    return(celsius + 273.15)
}
func KeltoCel(_ kelvin: Double) -> Double{
    return(kelvin - 273.15)
}
func KeltoFah(_ kelvin: Double) -> Double{
    return(kelvin - 273.15) * 9/5 + 32
}
func FahtoCel(_ fahrenheit: Double) -> Double{
    return(fahrenheit - 32) * 5/9
}
func FahtoKel(_ fahrenheit: Double) -> Double{
    return(fahrenheit - 32) * 5/9 + 273.15
}
//functoconvert
func Converter() {
    //input temperature
    guard let input = readLine(), let temperature = Double(input) else{
        print("Enter number2")
        return
    }
    print("Enter the (C for Celsius, F for Fahrenheit, K for Kelvin): ", terminator: "")
        
    guard let unit = readLine()?.uppercased(), unit == "C" || unit == "F" || unit == "K" else {
        print("Invalid unit input.")
        return
    }
    
    switch unit {
    case "C":
        let fahrenheit = CeltoFah(temperature)
        let kelvin = CeltoKel(temperature)
        print("\(temperature)°C is \(fahrenheit)°F and \(kelvin)K")
        
    case "K":
        let celsius = KeltoCel(temperature)
        let fahrenheit = KeltoFah(temperature)
        print("\(temperature)K is \(celsius)°C and \(fahrenheit)°F")
                
    case "F":
        let celsius = FahtoCel(temperature)
        let kelvin = FahtoKel(temperature)
        print("\(temperature)°F is \(celsius)°C and \(kelvin)K")
        
    default:
        print("Invalid input")
    }
}
Converter()
