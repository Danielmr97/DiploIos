//: [Previous](@previous)

import Foundation
let volunteerCounts = [1,3,40,32,2,53,77,13]
let volantierAverage = [10.75, 4.2, 1.5,12.12,16.815]

//map
//Crear un nuevo arreglo, no modifica el que le pasamos
//Regresa arreglo del mismo tamaño
//Itera sobre todos llos elementos de toda la collection
print("Uso de map")
let rounderVolunteers = volantierAverage.map { number in
    return Int(number)
}
print(rounderVolunteers)
print("----------------------------------------")
//filter
//Te regresa una collección que puede ser menor o igual al que le pasaste
print("Uso de filter")
let passingVolantieers = rounderVolunteers.filter { number in
    return number >= 10
}
print(passingVolantieers)
print("----------------------------------------")
//reduce
//Te regresa un unico valor
let totalVolantieers = passingVolantieers.reduce(0) {
    partialResult, number in
    return partialResult + number
}

print(totalVolantieers)

let finalVolantieersDescription = passingVolantieers.reduce("The voulantieers were") { partialResult, number in
    return partialResult + " \(number) "
    
}
print("Reduce con interno")
print(finalVolantieersDescription)
//: [Next](@next)
