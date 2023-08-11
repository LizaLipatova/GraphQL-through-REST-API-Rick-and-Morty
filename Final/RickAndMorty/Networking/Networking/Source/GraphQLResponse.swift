//
//  GraphQLResponse.swift
//  Networking
//
//  Created by Yelyzaveta Lipatova on 08.08.2023.
//

public enum GraphQLResponseError: Error {
    case error(errors: [GraphQLError])
}

public struct GraphQLResponse<Model: Decodable>: Decodable {
    
    public let data: Model?
    public var errors: [GraphQLError] = []
    
    enum CodingKeys: String, CodingKey {
        case data, errors
    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<GraphQLResponse<Model>.CodingKeys> = try decoder.container(keyedBy: GraphQLResponse<Model>.CodingKeys.self)

        self.data = try? container.decode(Model.self, forKey: GraphQLResponse<Model>.CodingKeys.data)
        self.errors = (try? container.decode([GraphQLError].self, forKey: GraphQLResponse<Model>.CodingKeys.errors)) ?? []
    }
}
