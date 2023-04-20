//
//  request.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation

enum BaseURLOptions {
    case searchBusiness
    case getBusinessById
}

func request(_ baseURLOptions:BaseURLOptions, params:[String], businessId:String) -> URLRequest {
    var baseURL : String = ""
    var paramsStringified : String = ""
    var completeURL:String = ""
    
    switch baseURLOptions {
    case .searchBusiness:
        baseURL = endpoints["searchBusiness"]!
        if !params.isEmpty {
            paramsStringified = "?" + params.joined(separator: "&")
        }
    case .getBusinessById:
        baseURL = endpoints["getBusinessById"]!
        if !businessId.isEmpty {
            paramsStringified = businessId
        }
    }
    completeURL = baseURL + paramsStringified
    
    let headers = [
        "accept": "application/json",
        "Authorization": "Bearer \(apiKey)"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: completeURL)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    return request as URLRequest
}
