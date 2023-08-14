//
//  QueryFactory.swift
//  RickAndMorty
//
//  Created by Yelyzaveta Lipatova on 08.08.2023.
//

import Foundation

class QueryFactory {
    static func getQuery(from fileName: String) throws -> String {
        guard let path = Bundle(for: AppDelegate.self).path(forResource: fileName, ofType: "json") else {
            throw(AppError.message("Can't get path for Resource: \(fileName)"))
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        
        return String(decoding: data, as: UTF8.self)
    }
}
