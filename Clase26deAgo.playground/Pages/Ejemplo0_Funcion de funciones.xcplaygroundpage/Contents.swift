import Foundation


print("Una función que recibe string y 2 funciones que no reciben ncada ni regresan nada")
func doAwsomeWork(on input:String, using transformer: ()-> Void, then completition: ()->Void)  {
    // Here would go the logic to do the awsome work
}
doAwsomeWork(on: "Diplomado") {
    
} then: {
    
}

doAwsomeWork(on: "Hola", using: {}, then: {})
