//
//  locationDetailsType.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation

struct LocationDetailsType: Codable {
    let address1: String
    let address2: String?
    let address3: String?
    let city: String
    let country: String
    let displayAddress: [String]
    let state: String
    let zipCode: String
    
    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city, country
        case displayAddress = "display_address"
        case state
        case zipCode = "zip_code"
    }
}
