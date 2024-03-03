//
//  Model.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import Foundation

struct Movies: Decodable {
    
}

struct MoviesRequest: Encodable {
    let cat: String
    let count: String
}


struct Filters: Codable {
    let filterName: String
    let iconName: String?
}

let mockFilters: [Filters] = [
    Filters(filterName: "Filter 1", iconName: "icon1"),
    Filters(filterName: "Filter 2", iconName: "icon2"),
    Filters(filterName: "Filter 3", iconName: "icon3"),
    Filters(filterName: "Filter 4", iconName: nil),
    Filters(filterName: "Filter 5", iconName: "icon5")
]
