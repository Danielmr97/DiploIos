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
    
    
    func getCountArray()-> Int{
        rowsArray.count
    }
    
    func getTitle(index: IndexPath) -> String{
        rowsArray[index.row].title
    }
    
    func getDescription(index: IndexPath) -> String{
        rowsArray[index.row].description
    }
    
    
}

