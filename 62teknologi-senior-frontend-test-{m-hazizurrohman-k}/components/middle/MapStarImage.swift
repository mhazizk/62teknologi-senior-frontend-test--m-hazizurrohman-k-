//
//  geStarImage.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation
import SwiftUI

/**
 just turn the rating into star symbols
 */
func MapStarImage(rating: Double) -> some View {
    let starFilled = "star.fill"
    let starHalfFilled = "star.leadinghalf.fill"
    let starUnfilled = "star"
    let ratingRemainder = rating.truncatingRemainder(dividingBy: 1)
    let ratingCount = Int(rating)
    var starSymbols: [String] = []
    
    // Add full star symbols
    for _ in 1...ratingCount {
        starSymbols.append(starFilled)
    }
    
    // Add half-filled star symbol if necessary
    if ratingRemainder >= 0.5 {
        starSymbols.append(starHalfFilled)
    }
    
    // Add unfilled star symbols
    while starSymbols.count < 5 {
        starSymbols.append(starUnfilled)
    }
    
    let starImage = HStack(spacing: 0) {
        ForEach(starSymbols, id:\.self) {
            star in
            Image(systemName: star)
                .foregroundColor(.red)
        }
    }
    
    return starImage
}
