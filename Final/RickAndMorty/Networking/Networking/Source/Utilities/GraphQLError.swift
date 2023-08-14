//
//  GraphQLError.swift
//  Networking
//
//  Created by Yelyzaveta Lipatova on 09.08.2023.
//

public struct GraphQLError: Swift.Error, Decodable {
    
    enum CodingKeys: CodingKey {
        case message
        case code
        case extensions
    }
    
    struct Extensions: Decodable {
        let code: String
    }

    let message: String?
    let code: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        let extensions = try container.decode(Extensions.self, forKey: .extensions)
        self.code = extensions.code
    }
}
