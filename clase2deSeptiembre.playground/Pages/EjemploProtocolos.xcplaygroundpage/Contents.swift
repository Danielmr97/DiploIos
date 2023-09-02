import Foundation
//Protocolo

protocol TabularDataSourse{
    var numberOfRows: Int {get}
    var numbarOfColums: Int {get}
    
    func label(forColumn column : Int) -> String
    func itemFor(row: Int, column : Int) ->String
}


let data = [
    ["Eva","30","6"],
    ["Salen", "40", "18"],
    ["Amit","50","20"]
 ]

func printTable(_ dataSourse: TabularDataSourse) {
    
    var headerRow = "|"
    var columnWitdths = [Int]()
    
    for index in 0..<dataSourse.numbarOfColums {
        let columnLabel = dataSourse.label(forColumn: index)
        let columnHeader = "\(columnLabel) |"
        headerRow += columnHeader
        columnWitdths.append(columnLabel.count)

    }
    print(headerRow)
    
    for index in 0..<dataSourse.numberOfRows{
        var output = "|"
        
      //  for (index, item) in row.enumerated(){”
        for columnIndex in 0..<dataSourse.numberOfRows{
            let item = dataSourse.itemFor(row: index, column: columnIndex)
            let paddingNeeded = columnWitdths[columnIndex] - item.count
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            output += "\(padding)\(item) |"
        }
        print(output)
    }
}


struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department : TabularDataSourse{
    
    let name: String
    var people = [Person]()
    
    init(name : String) {
        self.name = name
    }
    
    mutating func add (_ person: Person){
        people.append(person)
    }
    
    var numberOfRows : Int {people.count}
    var numbarOfColums : Int {3}
    
    func label(forColumn column: Int) -> String {
        let columnHeader : String
        switch column {
        case 0:
            columnHeader = "Employee name"
        case 1:
            columnHeader = "Age"
        case 2:
            columnHeader =  "Year of experencies"
        default: fatalError("Invalid column header index!")
        }
        return columnHeader
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        
        switch column{
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column Data")
        }
    }
}

var deparment = Department(name: "Engineering")
deparment.add(Person(name: "Eva", age: 30, yearsOfExperience: 6))
deparment.add(Person(name: "Saleh", age: 40, yearsOfExperience: 18))
deparment.add(Person(name: "Amit", age: 35, yearsOfExperience: 3))

printTable(deparment)
