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
    
    var headerHeight: CGFloat {
        switch self {
        case .profile:
            return 0.0
        case .search:
            return 140.0
        }
    }
    
    var rowHeight: CGFloat {
        switch self {
        case .profile:
            return 80.0
        case .search:
            return 1600.0
        }
    }
    
    var numberOfRowsInSection: Int {
        switch self {
        case .profile:
            return 1
        case .search:
            return 1
        }
    }
    
    var estimatedHeightForHeader: CGFloat {
        switch self {
        case .profile:
            return 0.0
        case .search:
            return 12.0
        }
    }
    
}


enum FaveAndNear {
    case favourite
    case nearYou
    
    var headerHeight: CGFloat {
        return 44.0
    }
    
    var numberOfRowsInSection: Int {
        switch self {
        case .favourite:
            return 1
        case .nearYou:
            return 10
        }
    }
    
    var estimatedHeightForHeader: CGFloat {
        switch self {
        case .favourite:
            return 120.0
        case .nearYou:
            return 120.0
        }
    }
    
    var heightForRowInSection: CGFloat {
        switch self {
        case .favourite:
            return 220.0
        case .nearYou:
            return 120.0
        }
    }
    
}
