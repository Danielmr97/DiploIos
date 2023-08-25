//: [Previous](@previous)

import Foundation

var cellphone: String = "5510293847"
var landline : String? = "000"



print(cellphone)
print(landline)



if let landline2 = landline {
    print(landline2)
    
}
//print(landline ?? "no tengo telefono")



guard let landline2 = landline else {
    
    fatalError("Ooops")
    
}

print(landline2)















//: [Next](@next)
