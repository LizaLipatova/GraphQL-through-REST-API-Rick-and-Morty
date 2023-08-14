//
//  CharactersQueryResponse.swift
//  RickAndMorty
//
//  Created by Yelyzaveta Lipatova on 09.08.2023.
//

struct CharactersQueryResponse: Codable {
    
    struct Character: Codable {
        let id: String
        let name: String
        let image: String
    }
    
    struct QueryChars: Codable {
        let results: [CharactersQueryResponse.Character]
    }
    
    let characters: QueryChars
}
