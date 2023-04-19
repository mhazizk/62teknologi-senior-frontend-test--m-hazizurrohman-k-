//
//  getAllBusiness.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation


extension URLSession {
    /**
     `getAllBusiness` will asynchronously call Yelp endpoint and return complete list of the available business from yelp within first `20` list
     */
    func getAllBusiness(at request: URLRequest, completion: @escaping (Result<BusinessSearchResultType, Error>) -> Void) {
        self.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let results = try JSONDecoder().decode(BusinessSearchResultType.self, from: data)
                    completion(.success(results))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
}
