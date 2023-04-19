//
//  getBusinessById.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation


extension URLSession {
    /**
            `getBusinessById` will asynchronously call Yelp endpoint and return business details from the given `id`
     */
    func getBusinessById(at request: URLRequest, completion: @escaping (Result<BusinessDetailsType, Error>) -> Void) {
    self.dataTask(with: request) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
            let business = try JSONDecoder().decode(BusinessDetailsType.self, from: data)
          completion(.success(business))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}
