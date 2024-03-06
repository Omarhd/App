//
//  Model.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import Foundation

struct AllPosts: Decodable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let code: Int?
    let messages: [String]?
    let data: [Post]?
}

// MARK: - Datum
struct Post: Codable {
    let id: Int?
    let title, contentHTML: String?
    let isVisible, forumID, creatorUserID: Int?
    let createdAt, updatedAt, type: String?
    let creator: Creator?
    let likesCnt, commentsCnt: Int?
    let isLiked: Bool?
    let postImages: [PostImage]?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case contentHTML = "content_html"
        case isVisible = "is_visible"
        case forumID = "forum_id"
        case creatorUserID = "creator_user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case type, creator
        case likesCnt = "likes_cnt"
        case commentsCnt = "comments_cnt"
        case isLiked = "is_liked"
        case postImages = "post_images"
    }
}

// MARK: - Creator
struct Creator: Codable {
    let id: Int?
    let email, password, birthdate: String?
    let isAdmin: Int?
    let createdAt, updatedAt, phoneNumber: String?
    let gender: String?
    let allowNotification, imgID: Int?
    let fullName: String?
    let profileImg: String?
    let imageUrls: ImageUrls?
    
    enum CodingKeys: String, CodingKey {
        case id, email, password, birthdate
        case isAdmin = "is_admin"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case phoneNumber = "phone_number"
        case gender
        case allowNotification = "allow_notification"
        case imgID = "img_id"
        case fullName = "full_name"
        case profileImg = "profile_img"
        case imageUrls = "image_urls"
    }
}

// MARK: - ImageUrls
struct ImageUrls: Codable {
    let the1X, the2X, the3X: String?
    
    enum CodingKeys: String, CodingKey {
        case the1X = "1x"
        case the2X = "2x"
        case the3X = "3x"
    }
}

// MARK: - PostImage
struct PostImage: Codable {
    let id: Int?
    let url: String?
    let createdAt, updatedAt, type: String?
    let postID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, url
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case type
        case postID = "post_id"
    }
}

struct AllPostsRequest: Encodable {
    let forumID: String
    
    enum CodingKeys: String, CodingKey {
        case forumID = "forum_unique_id"
    }
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
