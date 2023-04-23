//
//  Section.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 22/04/23.
//

import Foundation
import SwiftUI

func InfoDetailsSection(business:BusinessDetailsType) -> some View {
    
    func onPress() -> Void {
        return
    }
    
    return VStack {
        HStack {
            Text("Info")
                .bold()
                Spacer()
        }
        HStack{
            VStack {
                HStack {
                    Text("Hours")
                        .bold()
                        Spacer()
                }
                HStack(spacing: 4) {
                    if business.is_closed {
                        Pill(name: "Closed", color: .red)
                    } else {
                        Pill(name: "Open", color: .green)
                    }
                    Spacer()
                }
            }
            Spacer()
            IconButton(iconName: .globe, onPress: onPress)
            
        }
        
        Color.gray.opacity(0.2).frame(height: 1).padding(.vertical,16)

        
    }
    .padding(16)
}
