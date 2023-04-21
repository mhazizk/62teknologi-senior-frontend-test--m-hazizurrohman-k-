//
//  CustomList.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation
import SwiftUI

struct BusinessList : View {
    @Binding var businesses : [BusinessType]
    var params : [String]
    
    var body: some View {
        VStack {
            if businesses.isEmpty {
                VStack {
                    Spacer()
                    Image(systemName: "building.2")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.secondary)
                    Text("No business found").foregroundColor(.secondary)
                    Text("Try to search with different keywords").foregroundColor(.secondary)
                    Spacer()
                }
            } else {
                List(businesses) { business in
                    NavigationLink(destination: BusinessDetailsScreen(business: business)) {
                        HStack (alignment: .top){
                            
                            if !business.imageUrl.isEmpty {
                                AsyncImage(url: URL(string: business.imageUrl)){
                                    image in
                                    image.resizable()
                                    image.scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 86, height: 86)
                                .cornerRadius(8)
                                
                                
                            } else {
                                ZStack {
                                    Text("No image").font(.footnote)
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.5))
                                        .frame(width: 86, height: 86)
                                        .cornerRadius(8)
                                }
                            }
                            VStack(alignment: .leading){
                                
                                Text(String(business.name)).bold()
                                    .lineLimit(1, reservesSpace: false)
                                getStarImage(rating: business.rating)
                                Text(String(business.reviewCount) + " reviews").font(.footnote)
                                MapCategories(categories: business.categories)
                            
                            }
                            .padding(.leading,4)
                            Spacer()
                        }
                    }
                }
                
            }
        }
    }
}
