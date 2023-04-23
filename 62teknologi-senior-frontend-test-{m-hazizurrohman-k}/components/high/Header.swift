//
//  Header.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation
import SwiftUI

func Header(business:BusinessDetailsType) -> some View {
    return GeometryReader {
        geometry in
        ZStack (alignment: .top) {
            ImageCarousel(imageUrl: business.photos)
            HStack {
                VStack(alignment: .leading) {
                    
                    Spacer()
                    Text(business.name).bold().foregroundColor(.white).font(.largeTitle)
                    HStack (alignment: .center, spacing: 4){
                        MapStarImage(rating: business.rating)
                        Text(String(business.review_count)).bold().foregroundColor(.white)
                    }
                }
                Spacer()
            }
            .padding(16)
    
        }
//        .edgesIgnoringSafeArea(.top)
    }
}
