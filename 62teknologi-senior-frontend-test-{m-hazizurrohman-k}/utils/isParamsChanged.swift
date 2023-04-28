//
//  isParamsChanged.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation

/**
 check wether the query params has changed
 */
func isParamsChanged(params: [String]) -> Bool {
    let filteredDefaultParams = defaultParams.filter {
        !$0.hasPrefix("location=") &&
        !$0.hasPrefix("term=") &&
        !$0.hasPrefix("offset=")
        
    }
    let filteredParams = params.filter {
        !$0.hasPrefix("location=") &&
        !$0.hasPrefix("term=") &&
        !$0.hasPrefix("offset=")
        
    }
        return filteredParams != filteredDefaultParams
}
