//
//  PokemonListViewModel.swift
//  pokedex2
//
//  Created by Alejandro Mendoza on 17/11/23.
//

import Foundation
import UIKit

protocol PokemonListViewModelDelegate: AnyObject {
    func shouldReloadTableData()
}

class PokemonListViewModel {
    private let fileName = "pokemon_list"
    private let fileExtension = "json"
    
    private var pokemonList: [Pokemon] = []
    private var filterPokemonList: [Pokemon] = []
    private var favoritePokemonList : Set<Pokemon> = []
    
    let pokemonCellIdentifier = "pokemonCell"
    
    let searchBarPlaceholder = "Search"
    let viewTitle = "Pokedex"
    
    let numberOfSections: Int = 1
    var numberOfRows: Int { filterPokemonList.count }
    
    weak var delegate: PokemonListViewModelDelegate?
    
    init() {
        loadData()
        loadFavoritePokemon()
        
//        Nos avisa cuando esta pasando un evento
        NotificationCenter.default.addObserver(self, selector: #selector(saveFavoritePokemonsaveFavoritePokemon), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    func pokemon(at indexPath: IndexPath) -> Pokemon {
        filterPokemonList[indexPath.row]
    }
    
    private func loadData() {
        guard let fileURL = Bundle.main.url(forResource: fileName,
                                            withExtension: fileExtension),
              let pokemonData = try? Data(contentsOf: fileURL),
              let pokemonList = try? JSONDecoder().decode([Pokemon].self,
                                                          from: pokemonData)
        else {
            assertionFailure("Cannot find or read file: \(fileName)")
            return
        }
        
        self.pokemonList = pokemonList
        self.filterPokemonList = pokemonList
        
    }
    
    func filterPokemon(with searchText: String) {
        defer {
            delegate?.shouldReloadTableData()
        }
        
        guard !searchText.isEmpty else {
            filterPokemonList = pokemonList
            return
        }
        
        filterPokemonList = pokemonList.filter {
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.number.lowercased().contains(searchText.lowercased())
        }
    }
    
    @objc
    private func saveFavoritePokemonsaveFavoritePokemon(){
        guard let documentDictionary = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let fileName = "favorite_pokemon_list.json"
        let fileUrl = documentDictionary.appending(path: fileName)
        do {
            let favoritePokemonData = try JSONEncoder().encode(favoritePokemonList)
            let jsonFavoritePokemon = String(data: favoritePokemonData, encoding: .utf8)
            try jsonFavoritePokemon?.write(to: fileUrl, atomically: true, encoding: .utf8)
        }catch{
            assertionFailure("cannont encode favorite pokemon data")
        }
    }
    
    private func loadFavoritePokemon(){
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        let fileName = "favorite_pokemon_list.json"
        let favoritePokemonURL = documentDirectory.appending(path: fileName)
        do{
            let favoritePokemonData = try Data(contentsOf: favoritePokemonURL)
            let favoritePokemonLit = try JSONDecoder().decode(Set<Pokemon>.self, from: favoritePokemonData )
            self.favoritePokemonList = favoritePokemonLit
        }catch{
            assertionFailure("Cannot find ")
        }

    }
    
    func addPokemonToFavorites(indexpath : IndexPath){
        let favoritePokemon = filterPokemonList[indexpath.row]
        favoritePokemonList.insert(favoritePokemon)
        delegate?.shouldReloadTableData()
        
    }
    
    func isFavorite(pokemon : Pokemon) -> Bool{
        favoritePokemonList.contains(pokemon)
        
    }
    
    func pokemonName(at indexPath : IndexPath) -> String{
        let pokemon = pokemon(at : indexPath)
        if isFavorite(pokemon: pokemon){
            return pokemon.name + "🩷"
        }else {
            return pokemon.name
        }
    }
}




