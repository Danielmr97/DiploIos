//: [Previous](@previous)

import Foundation



var posicionUser:Int = 0

var tablero: [Int] = []
//2   10
//9   11
//8   17
//5   16
//-------
//21   10
//18   7
//13   3
//
//23   15
func game(){
    var dado = Int.random(in: 1...6)
    var posicionTemporal:Int = posicionUser + dado
    
    switch posicionTemporal {
    case 2:
        posicionUser = 10
    case 9:
        posicionUser = 11
    case 8:
        posicionUser = 17
    case 5:
        posicionUser = 16
        
    case 21:
        posicionUser = 10
    case 18:
        posicionUser = 7
    case 13:
        posicionUser = 3
    case 23:
        posicionUser = 15
        
    case 24...:
        print("wind")
        
    default:
        break
    }
    
    print(posicionTemporal)
    
    
}



game()
game()
game()
game()


//: [Next](@next)
