//
//  GraphQLRequest.swift
//  Networking
//
//  Created by Yelyzaveta Lipatova on 03.08.2023.
//

import Foundation

public protocol NetworkRequest {
    associatedtype ResponseDataType
    
    func create() -> URLRequest
    func parse(data: Data?) throws -> ResponseDataType
}

public struct GraphQLRequest<Variables: Codable, Response: Decodable>: NetworkRequest {
    
    public struct Body<Variables: Codable>: Codable {
        public let query: String
        public let variables: Variables?
        
        public init(query: String, variables: Variables?) {
            self.query = query
            self.variables = variables
        }
    }
    
    let url: URL
    let body: Body<Variables>
    
    public init(url: URL, body: Body<Variables>) {
        self.url = url
        self.body = body
    }
    
    public func create() -> URLRequest {
        let encoder: JSONEncoder = .init()
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try encoder.encode(body)
        } catch {
            print("Encoding error: \(error)")
        }

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }
    
    public func parse(data: Data?) throws -> Response {
        let decoder: JSONDecoder = .init()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let data = data else {
            throw NetworkError.message("Parsing failed")
        }
        
        return try decoder.decode(Response.self, from: data)
    }
}
