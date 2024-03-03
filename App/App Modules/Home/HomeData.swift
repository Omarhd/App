//
//  HomeData.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import UIKit

enum SectionType {
    case profile
    case search
    case favourite(Int?)
    case nearYou(Int?)
    
    var headerHeight: CGFloat {
        switch self {
        case .profile:
            return 0.0
        case .search:
            return 140.0
        case .favourite, .nearYou:
            return 44.0
        }
    }
    
    var numberOfRowsInSection: Int {
        switch self {
        case .profile:
            return 1
        case .search:
            return 0
        case .favourite(_):
            return 1
        case .nearYou(_):
            return 10
        }
    }
    
    var estimatedHeightForHeader: CGFloat {
        switch self {
        case .profile:
            return 0
        case .search:
            return 12.0
        case .favourite(_):
            return 12.0
        case .nearYou(_):
            return 12.0
        }
    }
    
}
