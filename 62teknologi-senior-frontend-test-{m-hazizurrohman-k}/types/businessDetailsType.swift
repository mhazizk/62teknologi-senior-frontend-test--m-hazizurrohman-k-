//
//  businessDetail.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation

struct BusinessDetailsType: Codable {
    let alias: String
    let categories: [CategoryType]?
    let coordinates: CoordinatesType?
    let display_phone: String?
    let distance: Double?
    let id: String
    let image_url: String
    let is_claimed: Bool?
    let is_closed: Bool
    let date_opened: String?
    let date_closed: String?
    let location: LocationDetailsType?
    let name: String
    let phone: String?
    let photos: [String]
    let photo_details: [PhotoDetailType]?
    let photo_count: Int?
    let price: String?
    let url:String?
    let review_count:Int
    let rating:Double
    let hours: [HoursType]?
    
    enum CodingKeys: String, CodingKey {
        case alias, categories, coordinates
        case display_phone = "display_phone"
        case distance, id, image_url
        case is_claimed = "is_claimed"
        case is_closed = "is_closed"
        case date_opened = "date_opened"
        case date_closed = "date_closed"
        case location, name, phone, photos
        case photo_details = "photo_details"
        case photo_count = "photo_count"
        case price
        case url, rating, review_count, hours
    }
}
