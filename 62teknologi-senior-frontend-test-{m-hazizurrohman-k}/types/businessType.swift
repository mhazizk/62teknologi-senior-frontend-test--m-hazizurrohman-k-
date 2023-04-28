//
//  businessType.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation


struct BusinessType: Codable, Identifiable {
    let alias: String
    let categories: [CategoryType]
    let coordinates: CoordinatesType
    let displayPhone: String?
    let distance: Double
    let id: String
    let imageUrl: String
    let isClosed: Bool
    let location: LocationType
    let name: String
    let phone: String?
    let price: String?
    let rating: Double
    let reviewCount: Int
    let transactions: [String]
    let url: String

    enum CodingKeys: String, CodingKey {
        case alias, categories, coordinates
        case displayPhone = "display_phone"
        case distance, id, imageUrl = "image_url"
        case isClosed = "is_closed"
        case location, name, phone, price, rating
        case reviewCount = "review_count"
        case transactions, url
    }
}
