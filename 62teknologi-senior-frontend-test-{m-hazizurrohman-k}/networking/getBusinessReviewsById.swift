//
//  getBusinessReviewsById.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 23/04/23.
//

import Foundation
import SwiftUI

/**
 wrapper of `URL session` to get top 3 business reviews with provided query and params
 */
func getBusinessReviewsById(
    isLoading: Binding<Bool>,
    businessId: String,
    data: Binding<BusinessReviewsType?>) -> Void {
        
        isLoading.wrappedValue = true
        
        let req = request(BaseURLOptions.getBusinessReviewsById, params: [], businessId: businessId)
        
        URLSession.shared.getBusinessReviewsById(request: req, completion: {
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
