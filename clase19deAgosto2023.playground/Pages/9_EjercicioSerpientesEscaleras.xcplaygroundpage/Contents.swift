//: [Previous](@previous)

/**
//--------------Casos------------
//2   10
//9   11
//8   17
//5   16
//-------
//21   10
//18   7
//13   3
//23   15
//-------------------------------

*/



import Foundation

var posicionUser:Int = 0
var tablero: [Int] = []
 while(posicionUser < 24){

    // --------Se genera un numero random que simula un dado va de 1 a 6  y se imprime en pantalla
    let dado = Int.random(in: 1...6)
    print("Se tira el dado: \(dado) ")
    
    print("Estas en la casilla: \(posicionUser) + \(dado) = \(posicionUser + dado)")
    // se suma el valor del dado a la posicion del usuario
    posicionUser = posicionUser + dado
    
    // se compomparan los casos espesiale: escalera , serpiente , si gano
    let posicionTemporal:Int = posicionUser
    
    switch posicionTemporal {
    case 2:
        posicionUser = 10
        print("Buena suerte escalera de 2 -> 10")
    case 9:
        posicionUser = 11
        print("Buena suerte escalera de 9 -> 11")
    case 8:
        posicionUser = 17
        print("Buena suerte escalera de 8 -> 17")
    case 5:
        posicionUser = 16
        print("Buena suerte escalera de 5 -> 16")
        
    case 21:
        posicionUser = 10
        print("T-T Cuidado serpiente de 21 -> 10")
    case 18:
        posicionUser = 7
        print("T-T Cuidado serpiente de 18 -> 7")
    case 13:
        posicionUser = 3
        print("T-T Cuidado serpiente de 13 -> 3")
    case 23:
        posicionUser = 15
        print("T-T Cuidado serpiente de 23 -> 15")
        
    case 24...:
        print("Wind - Ganaste *w* !!!")
        
    default:
        break
    }
    
    //----- se imprime la posicion del usuario
    
    if(posicionUser < 25){
        let valor  = posicionUser
        var cont = 0
        var fila = ""

    for i in 0...4{
        for _ in 0...4{
            
            if(i % 2 == 0){
                //fila =  "[\(24 - cont)]" + fila
                
                if(24-cont == valor){
                    fila =  "[x]" + fila
                }else{
                    fila =  "[ ]" + fila
                }
                
            }else{
                //fila = fila + "[\(24 - cont)]"
                if(24-cont == valor){
                    fila = fila + "[x]"
                }else{
                    fila = fila + "[ ]"
                }
            }
            cont = cont + 1
        }
        print(fila)
        
        fila = ""
    }
    }

    //----- Fin  se imprime la posicion del usuario
    
    //-- se imprime la posicion del usuario
    print("Estas en la casilla: \(posicionUser) ")
    print(" ")
    
    sleep(2)
   
    
    
}



//: [Next](@next)
