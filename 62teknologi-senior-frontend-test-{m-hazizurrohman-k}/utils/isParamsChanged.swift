//
//  isParamsChanged.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation

func isParamsChanged(params:[String]) -> Bool {
    if params.count != defaultParams.count { return true }
    if params.count == defaultParams.count {
        let newParams = params.filter({defaultParams.contains($0)})
        print(newParams.count)
        if newParams.count == 0 {return false}
    }
    return false
}
