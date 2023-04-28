//
//  Header.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation
import SwiftUI

/**
 this is header section of `BusinessDetailsScreen`
 */
func HeaderSection(distance:Double, business:BusinessDetailsType) -> some View {
    return GeometryReader {
        geometry in
        ZStack (alignment: .top) {
            ImageCarousel(imageUrl: business.photos)
            HStack {
                VStack(alignment: .leading) {
                    
                    Spacer()
                    Text(business.name).bold().foregroundColor(.white).font(.largeTitle)
                    HStack (alignment: .bottom, spacing: 8){
                        MapStarImage(rating: business.rating)
                        Text(String(business.review_count) + " reviews").bold().foregroundColor(.white)
                    }
                    HStack(spacing:16) {
                        Image(systemName: "mappin.and.ellipse").frame(width: 12, height: 12).foregroundColor(.white)
                        Text(String(format: "%.1f", distance / 1000)+" km  •  " + business.location!.address1).foregroundColor(.white)
                    }
                }
                Spacer()
            }
            .padding(16)
    
        }
//        .frame(height: (geometry.size.height * 0.3) + geometry.safeAreaInsets.top)
//        .edgesIgnoringSafeArea(.top)
    }
}
