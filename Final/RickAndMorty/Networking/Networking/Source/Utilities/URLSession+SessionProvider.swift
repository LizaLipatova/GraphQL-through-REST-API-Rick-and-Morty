//
//  URLSession+SessionProvider.swift
//  Networking
//
//  Created by Yelyzaveta Lipatova on 03.08.2023.
//

public protocol SessionProvider {
    func fetch(request: URLRequest) async throws -> (Data?, URLResponse?)
}

extension URLSession: SessionProvider {
    
    public func fetch(request: URLRequest) async throws -> (Data?, URLResponse?) {
        let (data, response) = try await data(for: request)
        return (data, response)
    }
}
