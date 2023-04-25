//
//  IconButton.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 22/04/23.
//

import Foundation
import SwiftUI


enum IconName :String {
    case phone = "phone"
    case map = "map"
    case globe = "globe"
    case menucard = "menucard"
    
}

func IconButton<Params>(iconName:IconName, onPress: @escaping (Params) -> Void) -> some View {
    let title :String
    switch iconName {
    case .map:
        title = "Map"
    case .globe:
        title = "Website"
    case .menucard:
        title = "Menu"
    case .phone:
        title = "Call"
    }
    return VStack(spacing: 8) {
        Button(action: {onPress(Params.self as! Params)}) {
            Image(systemName: iconName.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
                .padding(16)
                .background(Color.accentColor)
                .clipShape(Circle())
        }
        Text(title)
    }
}
