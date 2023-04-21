////
////  ImageLoader.swift
////  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
////
////  Created by Haziz on 21/04/23.
////
//
//import Foundation
//import SwiftUI
//
//
//struct ImageLoader : View {
//    
//    @Binding var url:String
//    @State var imageFetcher : ImageFetcher
//    
//    init() {
//        imageFetcher = ImageFetcher(url: url)
//    }
//    
//    var body: some View {
//        HStack {
//            if let image = UIImage(data: imageFetcher.data) {
//                Image(uiImage: image)
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .cornerRadius(8)
//            }
//        }
//    }
//}
