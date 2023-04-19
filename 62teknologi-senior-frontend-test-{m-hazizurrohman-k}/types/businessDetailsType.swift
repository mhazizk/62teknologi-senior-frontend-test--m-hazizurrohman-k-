//
//  businessDetail.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation

struct BusinessDetailsType: Codable {
    let alias: String
    let categories: [CategoryType]
    let coordinates: CoordinatesType
    let displayPhone: String?
    let distance: Double
    let id: String
    let imageUrl: String
    let isClaimed: Bool?
    let isClosed: Bool
    let dateOpened: String?
    let dateClosed: String?
    let location: LocationDetailsType
    let name: String
    let phone: String?
    let photos: [String]
    let photoDetails: [PhotoDetailType]
    let photoCount: Int
    let price: String?
    
    enum CodingKeys: String, CodingKey {
        case alias, categories, coordinates
        case displayPhone = "display_phone"
        case distance, id, imageUrl = "image_url"
        case isClaimed = "is_claimed"
        case isClosed = "is_closed"
        case dateOpened = "date_opened"
        case dateClosed = "date_closed"
        case location, name, phone, photos
        case photoDetails = "photo_details"
        case photoCount = "photo_count"
        case price
    }
}
