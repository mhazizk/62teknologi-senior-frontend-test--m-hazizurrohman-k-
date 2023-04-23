//
//  reviewsType.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 23/04/23.
//

import Foundation

struct ReviewType: Codable {
    let id: String
    let url: String?
    let text: String
    let rating: Double
    let time_created: String
    let user : UserType
}
