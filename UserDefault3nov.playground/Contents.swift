import UIKit

// User deafaul datos x
//Core data  (swift data) base de datos
//kitchen  token usr

let defaults = UserDefaults.standard

//Guardar dato

defaults.set(5, forKey: "Enero")
defaults.setValue("6", forKey:  "Valor")
defaults.setValue(["Uno","Dos"], forKey: "Array")

//Recuperar valor
defaults.object(forKey: "Enero")
//Con el tipo de dato (Castea)
defaults.integer(forKey: "Valor")
defaults.array(forKey: "Array")


struct myStruct: Codable {
    var variable1: String
    var variable2: Int
}

let myArray = [myStruct(variable1: "UNO", variable2: 2),myStruct(variable1: "Dos", variable2: 2)]

//Guardar dato
//Guardar el Json codificado en UserDefaults con una clave especifica
if let encodedData = try? JSONEncoder().encode(myArray){
    defaults.set(encodedData, forKey: "myArrayKey")
}

//Decode

if let savedData = defaults.data(forKey: "myArrayKey"), let decodeArray = try? JSONDecoder().decode([myStruct].self, from: savedData){
    for id in decodeArray{
        print(id)
    }
}else{
    print("No jalo")
}
