import UIKit

let animal = "dog"
var number = 2
if (animal == "dog"){
    print("It´s a dog")
}else{
    
    print("Not a dog")
}


if (animal.count <= 4){
    print("less than 4 letters")
}else{
    
    print("Not ess than 4 letters")
}


if (animal == "dog"||animal == "cat"){
    print("It´s a pet")
}else{
    
    print("Not a pet")
}


//solo entra a un caso , si el primero es tru solo se toma el primero

if (animal == "dog"){
    print("It´s a dog")
}else if number == 2 {
 
    print("two")
    
}else{
    
    print("Not a dog")
}



//if #unavailable (iOS 16.6, *){
//
//    //
//}else{
//
//    //codigo para So anteriores
//}


if #unavailable (iOS 15.0){
    // para anteriores
    
}

number == 2 ? print("its 2 "):print("some other number")

var value = number == 2 ? number:4

// Solucion ejercicio 1 ---------------//--------------

var weather = "nieve"
var time : Int = 12

var dark = Array(0...6) + Array(19...23)
var ligth = 7...18



//weather == "nieve" ? print("🌨️ nieve"):print("🌧️ lluvia")


if(weather == "nieve" ){
    print("🌨️ nieve")
}else if (weather == "lluvia" ) {
    print("🌧️ lluvia")
}else{
    print("no hay nieve ni lluvia")
}





if ligth ~= time {
    print("usa bloqueador")
    
    
}else{
    
    print("no necesitas bloqueador")
}






