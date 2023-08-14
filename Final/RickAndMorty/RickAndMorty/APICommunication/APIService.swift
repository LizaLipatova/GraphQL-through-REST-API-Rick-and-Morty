//
//  APIService.swift
//  RickAndMorty
//
//  Created by Yelyzaveta Lipatova on 09.08.2023.
//

import Networking

class APIService {
    
    private struct Configuration {
        let url: URL
        let charsQuery: String
    }
        
    private let networkService: NetworkService = .init()
    private let configuration: Configuration = .init(url: URL(string: "https://rickandmortyapi.com/graphql") ?? URL(filePath: ""),
                                                     charsQuery: (try? QueryFactory.getQuery(from: "CharactersQuery")) ?? "")

    func loadCharacters() async throws -> CharactersQueryResponse.QueryChars {
        typealias Request = GraphQLRequest<CharactersListVariables, GraphQLResponse<CharactersQueryResponse>>
        let variables: CharactersListVariables = .init(filter: .init(gender: nil, name: "Morty", species: nil, status: nil, type: nil), page: nil)
        
        let request = Request(url: configuration.url,
                              body: Request.Body(query: configuration.charsQuery, variables: variables))

        let result = try await networkService.perform(request: request)
        
        if let data = result.data {
            return data.characters
        } else {
            throw AppError.message("Data is nil")
        }
    }
}
