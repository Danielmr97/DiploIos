import UIKit

struct Dog {
    var isAdapter : Bool = true
    var color: String
    //Observadores
    var name : String {
        //Valor nuevo
        willSet(newName){
            print("My new name is \(newName)")
        }
        //Observador valor anterior
        didSet{
            print("My new name is \(oldValue)")
        }
    }
    static let amountOfPaws = 4
    var paws : Int = 4
    var specialNeeds: Bool {
        paws != Dog.amountOfPaws
    }
    
    func getID() -> String {
        return name + "\n" + "color: \(color)" + "\n" + "paws: \(paws)"
    }
    //Camniar lo que esta adentro del struct
    mutating func changeName(newName : String){
        name = newName
    }
    
    //Funciones de tipo
    static func describe() -> String{
        "Dog are really cute animals!"
    }
    
    // Inicializador perdemos el constructor generico
    init(name: String, isAdopted: Bool, color: String) {
        //self miniuscula accede a su propiedad y la vamos a asignar
        self.name = name
        self.isAdapter = isAdopted
        self.color = color
    }
    
    init(adopted name: String, color: String) {
        //self miniuscula accede a su propiedad y la vamos a asignar
        self.name = name
        self.isAdapter = true
        self.color = color
    }
    
    init(bought name : String, color: String) {
        self.init(name: name, isAdopted: false, color: color)
    }
    
    init(){
        self.init(adopted: "Milaneso", color: "Brown")
    }
}

var myDog = Dog(name: "Milo", isAdopted: true, color: "Brown")

myDog.isAdapter = false
myDog.name = "Dante"
myDog.paws = 3
myDog.specialNeeds
myDog.getID()
myDog.changeName(newName: "chilaquil")
Dog.amountOfPaws
Dog.describe()

var yourDog = Dog(adopted: "Chilaquil", color: "White")
var anotherdog = Dog()
