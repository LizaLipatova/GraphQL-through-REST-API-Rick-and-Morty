//
//  CharactersListViewModel.swift
//  RickAndMorty
//
//  Created by Yelyzaveta Lipatova on 03.08.2023.
//

import Foundation
import Combine

class CharactersListViewModel {

    let charactersListLoadedSubject = PassthroughSubject<Void, Never>()
    
    private(set) var characters: [CharactersQueryResponse.Character] = []
    private let api = APIService(session: URLSession.shared)
    
    init() {
        Task { @MainActor in
            self.characters = await loadData()
            self.charactersListLoadedSubject.send()
        }
    }
    
    private func loadData() async -> [CharactersQueryResponse.Character] {
        do {
            let characters = try await api.loadCharacters()
            return characters.results
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
