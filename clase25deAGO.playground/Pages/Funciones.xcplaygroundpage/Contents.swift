//: [Previous](@previous)

import Foundation

print("Valor por defecto")
 // función donde puedes pasarle el valor completo o el valor por defecto
func printWelcomeMessage (to name : String, course :String = "Diplomado Ios"){
    print("Hello \(name), welcome to \(course)")
}
//LLamado de la función completo
printWelcomeMessage(to: "Alejandro", course: "Diplomado Android")
//LLamando el valor por defecto y solo ingresando nombre
printWelcomeMessage(to: "PEPE")

print("-----------------------------------------------------")
print("\nParametro inout")
//Funciones con parametro inout
var error = "The porcess failed: "

func appendErrorCode(code: Int, toErrorString errorStering: inout String){
    if code == 400{
        errorStering += "bad request"
    }
}
print(error)
//se le asigna la copia del tipo de error
appendErrorCode(code: 400, toErrorString: &error)
print(error)

print("----------------------------------------------------\n")
print("Función con return")

func welcomeMessage(to name:String) -> String {
    return "Welcome \(name)"
}

let message = welcomeMessage(to: "Daniel")
print(message)

print("----------------------------------------------------\n")
print("Scope (todo lo que tiene acceso a la función)")
func areaOfTriangleWith(base : Double, height: Double) -> Double {
    let rectangle = base * height
    
    func divide() -> Double {
        return rectangle/2
    }
    
    return divide()
}
print("Imprimiendo el area final")
print(areaOfTriangleWith(base: 3, height: 5))

print("----------------------------------------------------\n")
print("Regresar multiples factores con tuplas")

func sortedEvenOddNumbers(_ numbers: [Int]) -> (events: [Int], odds: [Int]){
    var events = [Int]()
    var odds = [Int]()
    
    for number in numbers{
        if number % 2 == 0{
            events.append(number)
        }else{
            odds.append(number)
        }
    }
    return (events : events, odds : odds)
}

let aBunchOfNumber = [10,1,4,3,57,43,27,84]
let sortedEventAndOddNumbers = sortedEvenOddNumbers(aBunchOfNumber)
print("the even numbers are: \(sortedEventAndOddNumbers.events)")
print("the odd numbers are \(sortedEventAndOddNumbers.odds)")

print("----------------------------------------------------\n")
print("Recibiendo tuplas")
func grabMiddledName(fullName name: (first: String, middle: String?, last: String)) -> String?{
    //La tuppla tambien se puede acceder como si fuera lista con indices middle 1
    return name.middle
}

let middleName = grabMiddledName(fullName: (first: "Daniel", middle: "Jesus", last: "Mayo"))
if let middleName = middleName{
    print(middleName)
}

print("----------------------------------------------------\n")
print("Recibiendo tuplas y usando if let para tratar opcionals")
func greetByMiddleName(fromFullName name : (firt: String, middle : String?, last : String)) {
    if let middle = name.middle{
        print("het \(middle)")
    }
}
greetByMiddleName(fromFullName: (firt: "Jesus", middle: "Daniel", last: "Mayo"))

print("----------------------------------------------------\n")
print("Recibiendo tuplas y usando guard")

func greetByMiddleNamse(fromFullName name : (firt: String, middle : String?, last : String)) {
    //Se puede colocar varias validaciones con "," guard let middle = name.middle , age > 18
    guard let middleName = name.middle else {
        print("hey there")
        return
    }
    print("het \(middleName)")
}
greetByMiddleNamse(fromFullName: (firt: "Daniel", middle: nil, last: "pedro" ))

//https://github.com/Diplomado-7a-generacion/functions-exercises-Danielmr97/actions/runs/5982470108/job/16231590685#step:3:26

