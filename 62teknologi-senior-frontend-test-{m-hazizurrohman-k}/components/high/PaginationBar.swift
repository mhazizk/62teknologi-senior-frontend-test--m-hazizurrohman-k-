//
//  PaginationBar.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 26/04/23.
//

import Foundation
import SwiftUI

func PaginationBar(
    showingOfTotal : [Int],
    onPressPrevious: @escaping () -> Void,
    onPressNext : @escaping () -> Void
) -> some View {
    
    let currentOffset = showingOfTotal[0]
    let totalItems = showingOfTotal[1]
    let currentPage = Int(currentOffset / 20)
    
    let isPreviousDisabled = currentOffset <= 20
    let isNextDisabled = currentOffset + 20 >= totalItems
    
    return ZStack {
        HStack {
            Spacer()
            Text(String(currentPage))
                .frame(width: nil, alignment: .center)
            Spacer()
        }
        .padding(.bottom,16)
        VStack {
            HStack(alignment: .center) {
                Button(action:onPressPrevious){
                    HStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                        Text("Previous")
                    }
                }
                .disabled(isPreviousDisabled)
                
                Spacer()
                
                Button(action:onPressNext) {
                    HStack (spacing: 8){
                        Text("Next")
                        Image(systemName: "chevron.right")
                    }
                }
                .disabled(isNextDisabled)
            }
            Color.gray.opacity(0.2).frame(height: 1).padding(.top,4)
        }
        .padding(.vertical,8)
        .padding(.horizontal,32)
        
    }
}

