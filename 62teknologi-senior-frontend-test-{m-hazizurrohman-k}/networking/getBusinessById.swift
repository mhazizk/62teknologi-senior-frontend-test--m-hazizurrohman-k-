//
//  getBusinessById.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation
import SwiftUI

/**
 wrapper of `URL session` to get business details with provided query and params
 */
func getBusinessById(
    isLoading: Binding<Bool>,
    businessId: String,
    data: Binding<BusinessDetailsType?>) -> Void {
        
        isLoading.wrappedValue = true
        
        let req = request(BaseURLOptions.getBusinessById, params: [], businessId: businessId)
        
        URLSession.shared.getBusinessById(request: req, completion: {
            result in
            switch result {
            case .success(let fetched):
                data.wrappedValue = fetched
            case .failure(let error):
                print(error)
            }
        })
        isLoading.wrappedValue = false
        
        return
        
    }
