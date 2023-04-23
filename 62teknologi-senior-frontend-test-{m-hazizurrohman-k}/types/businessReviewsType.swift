//
//  businessReviewsType.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 23/04/23.
//

import Foundation

struct BusinessReviewsType: Codable {
    let reviews : [ReviewType]
    let total : Int
    let possible_languages : [String]
    
    enum CodingKeys: String, CodingKey {
        case reviews, total, possible_languages
    }
}
