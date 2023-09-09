import UIKit

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
    
    func myMap<U>(_ transformer: (Element) -> (U)) -> Stack<U> {
        var result = [U]()
        for item in items {
            let transformedItem = transformer(item)
            result.append(transformedItem)
        }
        return Stack<U>(items: result)
    }

}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)

var doubledStack = intStack.myMap { $0 * 2}
print(doubledStack.pop())
print(doubledStack.pop())

//Función generica que hace doble igual

func checkIfEqual<T : Equatable>(_ first: T, _ second: T ) -> Bool{
    return first == second
}

print(checkIfEqual(1, 2.0))
//MACCY
//Funcion que checa si 2 cosas son iguales
func checkIfDescriptionMatch <T : CustomStringConvertible, U : CustomStringConvertible> (_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}
print(checkIfDescriptionMatch(Int(2), 1.0))
print(checkIfDescriptionMatch(Float(1), Int(1)))

//Protocolo
//protocol IteratorProtocol {
//    associatedtype Element
//    mutating func next() -> Element?
//}

struct Stack2<Element> : Sequence {
    typealias Iterator = StackIterator
    
    typealias Element = StackIterator<Element>.Element
    
    var items = [Element]()

    mutating func push(_ newItem: Element){
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {return nil}
        return items.removeLast()
    }
    
    func makeIterator() -> StackIterator<Element>{
        return StackIterator(stack: self)
    }
    
    mutating func pushAll  <S: Sequence >(_ sequence : S) where S.Element == Element{
        for item in sequence {
            self.push(item )
        }
    }

}

struct StackIterator<T>: IteratorProtocol {
    typealias Element = T
    var stack : Stack2<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

var myStack = Stack2<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)
var myStackIterator = StackIterator(stack: myStack)

while let value = myStackIterator.next(){
    print(value)
}


//protocol Sequence{
//    associatedtype Iterator : IteratorProtocol
//    associatedtype Element where Element ==     Iterator.Element
//
//    func makeIterator() -> Iterator
//}

for value in myStack {
    print("for in loop \(value)")
}

let mySet : Array<Int> = [1,2,3,4]
myStack.pushAll(mySet)
