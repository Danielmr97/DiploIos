//: [Previous](@previous)

import Foundation


// enumeradores tipos de primera clase en singular


enum Pet: String {
    case dog = "🐶"
    case cat = "🐱"
    case mouse = "🐭"
    case parakeet = "🦜"
    case turtle = "🐢"
    
    
}


let myPet = Pet(rawValue: "🐶") // ver si esta en mis casos
let myTurtle: Pet = .turtle      // yo elijo la tortuga
let myParaKeet = Pet.parakeet


switch myPet {
case .dog:print("🦜")
default: print(myPet?.rawValue)
    
}











//: [Next](@next)
