//
//  NetworkService.swift
//  Networking
//
//  Created by Yelyzaveta Lipatova on 08.08.2023.
//

import Foundation

public struct NetworkService {
        
    public init() {}
    
    public func perform<Request: NetworkRequest>(request: Request) async throws -> Request.ResponseDataType {
        do {
            let urlRequest = request.create()
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.message("InvalidResponse")
            }
            
            guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                throw NetworkError.message("InvalidStatusCode - \(httpResponse.statusCode)")
            }

            do {
                let parsedData = try request.parse(data: data)
                return parsedData
            } catch {
                throw NetworkError.message("Data parsing failed with message - \(error)")
            }
        } catch {
            throw NetworkError.message("NetworkError - \(error)")
        }
    }
}
