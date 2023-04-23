//
//  Review.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 23/04/23.
//

import Foundation
import SwiftUI

func Review(review:ReviewType) -> some View {
    
    return VStack(alignment: .leading) {
        HStack(alignment: .top) {
            VStack (alignment: .leading){
                HStack(alignment: .top) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.black)
                        .frame(width: 16, height: 16)
                        .padding(12)
                        .background(.gray.opacity(0.3))
                        .clipShape(Circle())
                    VStack (alignment: .leading){
                        Text(review.user.name)
                            .bold()
                        Text(getRelativeDateString(from:review.time_created)!).font(.subheadline).foregroundColor(.gray)
                        
                    }
                    .padding(.leading, 8)
                }
                MapStarImage(rating: review.rating)
                    .padding(.vertical,4)
            }
            Spacer()
        }
        Text(review.text)
        Color.gray.opacity(0.2).frame(height: 1).padding(.top,8)
    }
    .padding(.bottom,8)
    .padding(.horizontal,16)
}
