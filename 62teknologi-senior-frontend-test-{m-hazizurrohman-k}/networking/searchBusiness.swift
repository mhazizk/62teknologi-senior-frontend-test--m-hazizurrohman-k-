//
//  search.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation
import SwiftUI

/**
 wrapper of `URL session` to search business with provided query and params
 */
func searchBusiness(
    isLoading: Binding<Bool>,
    isFetched:Binding<Bool>,
    data: Binding<[BusinessType]>,
//    initialOffset:Int,
//    showingOfTotal : Binding<[Int]>,
    totalFound: Binding<Int>,
    params: [String]) -> Void {
    isLoading.wrappedValue = true
    isFetched.wrappedValue = false
    let req = request(BaseURLOptions.searchBusiness, params: params, businessId: "nil")
    
    URLSession.shared.getAllBusiness(request: req, completion: {
        result in
        switch result {
        case .success(let fetched):
            data.wrappedValue = fetched.businesses
            totalFound.wrappedValue = fetched.total
        case .failure(let error):
            data.wrappedValue = []
            totalFound.wrappedValue = 0
            print(error)
        }
    })
        isLoading.wrappedValue = false
        isFetched.wrappedValue = true
    
    return
    
}
