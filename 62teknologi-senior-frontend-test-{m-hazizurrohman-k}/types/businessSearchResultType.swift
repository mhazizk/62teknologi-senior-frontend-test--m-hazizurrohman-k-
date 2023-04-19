//
//  businessSearchType.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation

struct BusinessSearchResultType: Codable {
    let businesses: [BusinessType]
    let region: RegionType
    let total: Int
}

