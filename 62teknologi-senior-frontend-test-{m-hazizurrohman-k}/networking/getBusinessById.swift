//
//  getBusinessById.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation
import SwiftUI


func getBusinessById(
    isLoading: Binding<Bool>,
//    isFetched:Binding<Bool>,
    businessId: String,
    data: Binding<BusinessDetailsType?>) -> Void {
        
        isLoading.wrappedValue = true
//        isFetched.wrappedValue = false
        
        let req = request(BaseURLOptions.getBusinessById, params: [], businessId: businessId)
        
        URLSession.shared.getBusinessById(at: req, completion: {
            result in
            switch result {
            case .success(let fetched):
                data.wrappedValue = fetched
            case .failure(let error):
                print(error)
            }
        })
//        isFetched.wrappedValue = true
        isLoading.wrappedValue = false
        
        return
        
    }
