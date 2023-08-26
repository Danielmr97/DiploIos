//: [Previous](@previous)

import Foundation

class Car {
    var wheels : Int
    var color : String
    
    init(wheels: Int, color : String) {
        self.wheels = wheels
        self.color = color
    }
}

let myCar = Car(wheels: 4, color: "Black")
myCar.color = "Blue"

let copyOfMyCar = myCar
copyOfMyCar.color = "Red"


struct Dog {
    var name: String
    var isAdopter : Bool
}

var dante = Dog(name: "Dante",isAdopter : true)
dante.name = "Juan"
var danteClone = dante
danteClone.isAdopter = false
print(dante.isAdopter)
print(danteClone.isAdopter)


class Vehicle {
    var wheels : Int?
    
    init (wheels : Int){
        self.wheels = wheels
    }
}

//class Scooter : Vehicle{
//    var color : String
//    
//}
//
//let myVehicle = Scooter()
//
