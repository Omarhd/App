//
//  HTTPNetworkService.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import Foundation

class HTTPNetworkService: NetworkService {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - GET Request
    func get<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await session.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    // MARK: - GET Request with Query Parameters
    func getWithParametres<T>(url: URL, parameters: Encodable) async throws -> T where T : Decodable {
        var request = URLRequest(url: url)
        let parameters = parameters
        request.httpBody = try? JSONEncoder().encode(parameters)
        
        request.setValue("5c22c223admshc430a34e7691661p1d9476jsn59dfd5b68374", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("andruxnet-random-famous-quotes.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")

        let (data, response) = try await session.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    // MARK: - POST Request
    func post<T: Decodable>(url: URL, body: Data?) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    // MARK: - PUT Request
    func put<T: Decodable>(url: URL, body: Data?) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = body
        
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}
