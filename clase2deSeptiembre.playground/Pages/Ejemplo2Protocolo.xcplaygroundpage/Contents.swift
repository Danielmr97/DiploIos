import UIKit

protocol Student {
    var accountNumber: Int {get}
    var name: String { get }
}
 
struct EngineeringStudent : Student, CustomStringConvertible {
    var accountNumber: Int
    var name: String
    let hasCalculator : Bool
    
    var description: String {
        return "Engineer student \(name)"
    }
}

let engineeringStudent = EngineeringStudent(accountNumber: 314021495, name: "Alejandro", hasCalculator: false)

struct MediceStudent : Student {
    var accountNumber: Int
    var name: String
    let hasLabCoat : Bool
}

let medicineEstudent = MediceStudent(accountNumber: 314029876, name: "Cludia", hasLabCoat: true)

func printStudentInformation(_ student : Student){
    print("\(student.name) - \(student.accountNumber)")
    
    if let medicineStudent = student as? MediceStudent{
        print(medicineStudent.hasLabCoat)
    }
}

printStudentInformation(engineeringStudent)
printStudentInformation(medicineEstudent)

print(engineeringStudent)
