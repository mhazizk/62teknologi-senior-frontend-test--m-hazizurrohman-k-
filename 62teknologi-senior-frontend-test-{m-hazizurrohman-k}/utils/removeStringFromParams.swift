//
//  removeStringFromParams.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation

/**
 remove array of strings from query params
 */
func removeStringFromParams(params:[String], stringToRemove:[String]) -> [String] {
    var newParams = params
    if stringToRemove.count == 1 {
        newParams = params.filter({!$0.contains(stringToRemove[0])})
    } else {
        newParams = params.filter({ !stringToRemove.contains($0)})
    }
    return newParams
}
