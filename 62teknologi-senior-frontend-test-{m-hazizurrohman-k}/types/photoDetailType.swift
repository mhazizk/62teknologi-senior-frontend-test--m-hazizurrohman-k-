//
//  photoDetailType.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation

struct PhotoDetailType: Codable {
    let photoId: String
    let url: String
    let caption: String
    let width: String
    let height: String
    let isUserSubmitted: String
    let userId: String?
    let label: String
    
    enum CodingKeys: String, CodingKey {
        case photoId = "photo_id"
        case url, caption, width, height
        case isUserSubmitted = "is_user_submitted"
        case userId = "user_id"
        case label
    }
}
