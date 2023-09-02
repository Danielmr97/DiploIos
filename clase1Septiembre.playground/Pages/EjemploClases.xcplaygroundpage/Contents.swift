//: [Previous](@previous)

import Foundation
 
class Vehicle {
    var brand: String
    let model: String
    var owner: String?
    let serialNumber: String
    var wheels: Int?
    //Variable computada
    var type: String {
        //Terneario
    return (wheels ?? 0) > 0 ? "land" : "other"
    }
    //Get y set
    var registration: (name: String, serialNumber: String, type: String)?{
        get{
            if let owner = owner{
                return (owner, serialNumber, type)
            }
            return nil
        }
        set(newRegistration){
            if let newRegistration = newRegistration {
                owner = newRegistration.name
            }
        }
    }
    
    init(brand : String, model : String, serialNumber : String, owner :String?, wheels : Int? ) {
        self.brand = brand
        self.model = model
        self.serialNumber = serialNumber
        self.owner = owner
        self.wheels = wheels
    }
    
    init(brand : String, model : String, serialNumber : String, wheels : Int? ) {
        self.brand = brand
        self.model = model
        self.serialNumber = serialNumber
        self.wheels = wheels
    }
    var isMoving : Bool = false
    
    //Instancia
    func move(){
        isMoving = true
    }
    
    func stop(){
        isMoving = false
    }
    //Medio del tipo
    static func describe(){
        print("a vehicle")
    }
    
    func makeNoise() -> String {"Noise"}
}
//: [Next](@next)
let myVehicle = Vehicle(brand: "Benedeti", model: "Oasis", serialNumber: "1234567890", owner: "DANIEL", wheels: nil)

myVehicle.registration = (name: "Pedro", serialNumber: "0987654321", type: "Mar")
myVehicle.move()
myVehicle.isMoving
//Tipo
Vehicle.describe()


class Car: Vehicle {
    override var type: String {
        return "Car"
    }
    
    var isElectric : Bool
    
    
    init(isElectric: Bool){
        self.isElectric = isElectric
        super.init(brand: "Toyota", model: "Yaris", serialNumber: "1111111111", owner: nil, wheels: 4)
    }
    
      //Sobre escritura
    override func makeNoise() -> String {
        "BRRRRRRRRRRR"
    }
    
    override init(brand: String, model: String, serialNumber: String, wheels: Int?) {
        isElectric = brand == "Toyota"
        super.init(brand: brand, model: model, serialNumber: serialNumber, wheels: wheels)
    }
    
    init(brand: String, model: String, serialNumber: String, isElectric : Bool) {
        self.isElectric = isElectric
        super.init(brand: brand, model: model, serialNumber: serialNumber, wheels: 4)
    }
    
    convenience init (susukiModel model : String,  serialNumber : String, isElectric: Bool, boughtBy name: String) {
        self.init(brand: model, model: serialNumber, serialNumber: serialNumber, isElectric: isElectric)
        owner = name
    }
    
    override var brand: String  {
        //Valor nuevo
        willSet(newName){
            print("My new name is \(newName)")
        }
        //Observador valor anterior
        didSet{
            print("My old name is \(oldValue)")
        }
    }
    
}
let myCar = Car(isElectric : true)
myCar.isElectric
myCar.brand
myCar.makeNoise()

let yourCar = Car(brand: "Zusuki", model: "SWIFT", serialNumber: "12324254356546", isElectric: false)
myCar.brand = "Tesla"

