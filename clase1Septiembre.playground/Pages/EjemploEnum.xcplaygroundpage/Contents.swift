//: [Previous](@previous)

enum pet: String {
    
    case dog = "🐶"
    case cat = "🐱"
    case mouse = "🐭"
    case parrot = "🦜"
    case turtle = "🐢"
    
    var type : String {
        switch self {
        case .dog, .cat,.mouse : return "mamifero"
        case .turtle : return "reptil"
        case .parrot : return "ave"
        }
    }
    
    init?(name: String) {
        switch name{
        case "dog" : self.init(rawValue: "🐶")
        default: return nil
        }
    }
}

let mypet = pet.dog.type
let myBird = pet.parrot.type
let myReptil = pet.turtle.type

let myDog = pet(rawValue: "🐶")


