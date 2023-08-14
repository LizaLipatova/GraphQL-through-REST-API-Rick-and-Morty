//
//  CharactersListViewModel.swift
//  RickAndMortyStart
//
//  Created by Yelyzaveta Lipatova on 09.08.2023.
//

import Foundation
import Combine

class CharactersListViewModel {

    let charactersListLoadedSubject = PassthroughSubject<Void, Never>()
    
    private(set) var characters: [CharactersQueryResponse.Character] = []
    
    init() {}
}
