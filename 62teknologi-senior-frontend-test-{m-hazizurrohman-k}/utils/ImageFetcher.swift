////
////  ImageFetcher.swift
////  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
////
////  Created by Haziz on 21/04/23.
////
//
//import Foundation
//
//
//struct ImageFetcher {
//    var url:String
//    var data: Data
//    
//    init(url: String) {
//        guard let imageUrl = URL(string: url) else {
//            return
//        }
//        
//        URLSession.shared.dataTask(with: imageUrl) { (data, _, _) in
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                self.data = data
//            }
//        }.resume()
//    }
//    
//}
