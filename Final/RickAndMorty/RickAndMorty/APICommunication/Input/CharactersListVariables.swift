//
//  CharactersListVariables.swift
//  RickAndMorty
//
//  Created by Yelyzaveta Lipatova on 09.08.2023.
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
