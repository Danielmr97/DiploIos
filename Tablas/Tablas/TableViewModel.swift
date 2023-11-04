//
//  TableViewModel.swift
//  Tablas
//
//  Created by Daniel Mayo on 27/10/23.
//

import Foundation

struct Rows {
    var title: String
    var description: String
}




class TableViewModel{
    var rowsArray : [Rows]
    
    init() {
        rowsArray = [Rows(title: "Pikachu", description: "Electrico"),Rows(title: "Charmander", description: "Fuego"),Rows(title: "Gengar", description: "Fantasmas"),Rows(title: "Dragonite", description: "Dragon")]
    }
    
    func addRow(text :String){
        rowsArray.append(Rows(title: text, description: ""))
    }
    
    func getCountArray()-> Int{
        rowsArray.count
    }
    
    func getTitle(index: IndexPath) -> String{
        rowsArray[index.row].title
    }
    
    func getDescription(index: IndexPath) -> String{
        rowsArray[index.row].description
    }
    
    func deleteRow(index : IndexPath){
        rowsArray.remove(at: index.row)
    }
    
    func getSection() -> Int{
        2
    }
    func getSectionTitle() -> String {
        "Pokemon"
    }
}

