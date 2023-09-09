//Elemento Generico
struct Stack<Element> {
    var items = [Element]()

    mutating func push(_ newItem: Element){
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {return nil}
        return items.removeLast()
    }

}
var intStack : Stack<Int> = Stack()
intStack.push(1)
intStack.push(2)

//print(intStack.pop())
//print(intStack.pop())
//print(intStack.pop())


func myMap<T, U>(_ item:[T],_ transformer: (T) -> (U)) -> [U]  {
    var result = [U]()
    
    for item in item {
        let transformedItem = transformer(item)
        result.append(transformedItem)
    }
    return result
}

let myStrings = ["one",  "two", "three"]
let stringsLengths = myMap(myStrings) {
    return $0.count > 2
}
print(stringsLengths)
