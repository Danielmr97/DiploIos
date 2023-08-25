//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

var coordenadas = (5,4)

//switch coordenadas{
//case (0,0):print("Esta en orige")
//case let(x,0) where x<5 : print("estan en el eje x")
//case let(0,y) where y<5 : print("estan en el eje y")
////case let(x,y) where x<4 || y<4 : print("estan en el cuadrante")
//default: print("fuera de rango")
    
    
//}

switch coordenadas{
case (0,0)     : print("Esta en orige")
case (-4...4,0): print("Estan en el eje X en: \(coordenadas.0)")
case (0,-4...4): print("Estan en el eje Y en: \(coordenadas.1)")
case (-4...4,-4...4): print("Estan en el cuadrante: \(coordenadas)")
default: print("Fuera de rango")
    
    
}


//------------------------
var animal = "dog"//"cat"

guard animal == "dog" else{
    
    fatalError("It´s not a dog 😭")
    
}






//: [Next](@next)
