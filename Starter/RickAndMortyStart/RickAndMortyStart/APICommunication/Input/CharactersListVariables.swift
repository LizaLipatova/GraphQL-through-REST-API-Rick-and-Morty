//
//  CharactersListVariables.swift
//  RickAndMortyStart
//
//  Created by Yelyzaveta Lipatova on 10.08.2023.
//

struct CharactersListVariables: Codable {

    struct FilterCharacter: Codable {
        let gender: String?
        let name: String?
        let species: String?
        let status: String?
        let type: String?
    }
    
    let filter: FilterCharacter?
    let page: Int?
}
