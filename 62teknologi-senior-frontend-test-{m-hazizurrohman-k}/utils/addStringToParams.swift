//
//  addStringToParams.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation

/**
 add array of strings into query params
 */
func addStringToParams(params:[String], stringToAdd:[String], avoidDuplicate:Bool = false) -> [String] {
    
    var existingParams = params
    
    if avoidDuplicate {
        existingParams =  removeStringFromParams(params: params, stringToRemove: stringToAdd)
    }
    let newParams = existingParams + stringToAdd
    return newParams
}
