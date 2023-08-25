//: [Previous](@previous)

import Foundation

var animal = "dog"

switch animal {
    
case "dog":print("🐶")
case "cat":print("🐱")
case "mouse":print("🐭")
case "bird":print(" 🦜")
    
default:break
    
}



switch animal {
    
case "dog","cat":print("🐶 🐱 a mi me gustan")
case "mouse","bird":print("🐭 🦜 son divertidos")
    
default: print("meh")
    
}


let grande = 9
switch grande {
case ...5: print("Failed")
case 6..<9: print("Meh")
case 9: print("its gread")
case 10: print("wow")
default: print(":v")
}


var color = (255,255,255)

switch color{
case (_, _, 255):
    print("max blue")
    fallthrough // se ejecuta el sigiente caso ya no compara
case (_, 1, _):print("max green")
case (1, _, _):print("max red")
default:break
    
}


color = (1,2,255)
switch color{
case (let r,let g, 255) where g < 255:print("red:\(r) gren\(g) max blue")
case let(r, 255, b):print("red:\(r) blue\(b) max green")
case (1, _, _):print("max red")
default:break
    
}















//: [Next](@next)
