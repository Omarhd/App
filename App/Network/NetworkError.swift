//
//  NetworkError.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case statusCode(Int)
    case requestFailed(Error)
}
