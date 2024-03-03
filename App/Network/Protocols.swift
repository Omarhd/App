//
//  Protocols.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import Foundation

protocol NetworkService {
    func get<T: Decodable>(url: URL) async throws -> T
    func getWithParametres<T: Decodable>(url: URL, parameters: Encodable) async throws -> T
    func post<T: Decodable>(url: URL, body: Data?) async throws -> T
    func put<T: Decodable>(url: URL, body: Data?) async throws -> T
}
