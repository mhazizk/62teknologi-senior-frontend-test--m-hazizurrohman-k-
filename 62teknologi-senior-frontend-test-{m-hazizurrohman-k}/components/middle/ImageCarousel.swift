//
//  ImageCarousel.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation
import SwiftUI


func ImageCarousel(imageUrl: [String]) -> some View {
    return GeometryReader {
        geometry in
        ScrollView(.horizontal) {
            HStack (spacing: 0){
                ForEach(imageUrl, id:\.self) {
                    url in
                    ZStack {
                        
                        AsyncImage(url: URL(string: url)){
                            image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                        .clipped()
                        
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]),
                            startPoint: .bottom,
                            endPoint: .top)
                    }
                }
            }
        }
        .background(.black)
        .frame(height: geometry.size.height)
        .edgesIgnoringSafeArea(.top)
    }
}
