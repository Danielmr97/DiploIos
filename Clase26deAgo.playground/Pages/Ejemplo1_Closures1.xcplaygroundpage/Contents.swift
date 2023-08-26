//: [Previous](@previous)

import Foundation

//Closure

let volunteerCounts = [1,3,40,32,2,53,77,13]

func isAdcending(_ i:Int, _ j:Int ) -> Bool{
    return i>j
}
print("Ordenando con una función")
let voluntierSorted = volunteerCounts.sorted(by: isAdcending)
print(voluntierSorted)
print("----------------------------------------")

print("Implementando closure")
let volantiersSorted = volunteerCounts.sorted(by: {(i:Int, j:Int)-> Bool in return i<j})
print(volantiersSorted)
print("----------------------------------------")
print("traiding closure")
let volantiersSortedd = volunteerCounts.sorted {$0 < $1}
print(volantiersSortedd)

//let volunteerCounts = [1,3,40,32,2,53,77,13]
print("----------------------------------------")
print("Una función que recibe double y una unción que tenga double y regrese string")
let volantierAverage = [10.75, 4.2, 1.5,12.12,16.815]
func format(numbers : [Double], using formatter : (Double) -> String) -> [String] {
    var result = [String]()
    
    for number in numbers{
        let transformedNumber = formatter(number)
        result.append(transformedNumber)
    }
    
    return result
}

func rounder(_ number:Double) -> String{
    let roundedNumber : Int = Int(number)
    return "\(roundedNumber)"
}

func addDescription(_ number : Double) -> String {
    return "Volantier average: \(number)"
}

let formatterAvaregeVolantiers = format(numbers: volantierAverage,
                                        using: rounder)
print(formatterAvaregeVolantiers)

let AverrageVolantiersDescription = format(numbers: volantierAverage, using: addDescription)
print(AverrageVolantiersDescription)


print("----------------------------------------")
print("Una función que recibe double y un closure")
print("Con esto ya no es necesario incluir una función debido a que ya se esta colocando como predeterminado")
func format2(numbers : [Double], using formatter : (Double) -> String = {"\($0)"}) -> [String] {
    var result = [String]()
    
    for number in numbers{
        let transformedNumber = formatter(number)
        result.append(transformedNumber)
    }
    
    return result
}

print(format2(numbers: volantierAverage))
