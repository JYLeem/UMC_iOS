//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jinyoung Leem on 3/21/24.
//

import Foundation

struct PokemonList: Codable{
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: String
}

struct PokemonData: Codable {
    let id: Int
    let types: [PokemonTypeEntry]
}

struct PokemonType: Codable {
    let name: String
    let url: String
}

struct PokemonTypeEntry: Codable {
    let slot: Int
    let type: PokemonType
}

