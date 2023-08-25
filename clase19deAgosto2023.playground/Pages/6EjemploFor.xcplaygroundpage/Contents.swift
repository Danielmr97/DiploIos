//: [Previous](@previous)

import Foundation



for i in 1...5{
    
    //print(i)
    
}


let numbers = [1,3,5,7]

for number1 in numbers {
    print(number1)
    
}



let intervals = stride(from: 0, to: 20, by: 5)
//let intervals2 = stride(from: 0, to: 20, by: 5)


print("------>>>>----")
for num in intervals {
    
    print(num)
    
}


let pokemon = ["Fire":"Charmander","Water":"Mudkip","Grass":"Turtwig","Electric":"Pikachu",]


for (type, name) in pokemon {
    
    print("I like \(name) of type \(type) ")
    
}
print("------>>>>----")

for poke in pokemon {
    
    print("I like \(poke.value) of type \(poke.key) ")
    
}

for (index, (type, name)) in pokemon.enumerated() {
    
    print("\(index) \(type) \(name)")
    
}






let names : Set = ["James","Dean", "Sam", "steve","Chris"]

print("\n For-in loop whith counter as index")
var index = 0

for _ in names{
    
    print(index)
    index += 1
}



for (index2 , name) in names.enumerated(){
    
    print(index2, name)
}

for (index2 , name) in names.enumerated(){
    
    if(index2 % 2 == 0){
        
        print(index2, name)
    }else{
        break
    }
}


print("---------/1/-------------")
for (index2 , name) in names.enumerated(){
    
    if(index2 % 2 == 0){
        continue
       
    }
    print(index2, name)
}




print("---------/2/-------------")
for (index2 , name) in names.enumerated() where index2 % 2 == 0 {
    print(index2, name)
}


//: [Next](@next)
