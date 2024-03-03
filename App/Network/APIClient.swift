//
//  APIClient.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import Foundation

class APIClient {
    
    private let networkService = HTTPNetworkService()
            
    func get<T: Decodable>(from url: URL) async throws -> T {
        return try await networkService.get(url: url)
    }

    func getWithParameters<T: Decodable>(from url: URL, parameters: Encodable) async throws -> T {
        return try await networkService.getWithParametres(url: url, parameters: parameters)
    }
    
    
    func postData<T: Decodable>(to url: URL, body: Data?) async throws -> T {
        return try await networkService.post(url: url, body: body)
    }
    
}
