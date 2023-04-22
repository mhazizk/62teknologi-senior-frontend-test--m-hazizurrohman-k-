//
//  ActionBar.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 22/04/23.
//

import Foundation
import SwiftUI

func ActionBar(business:BusinessDetailsType) -> some View {
    let phone = business.phone
    let website = business.url
    let map = business.location?.address1
//    let menu = business
    
    func onPress() -> Void {
        return
    }
    
    return HStack(spacing: 16) {
        Spacer()
        IconButton(iconName: .phone, onPress: onPress)
        IconButton(iconName: .map, onPress: onPress)
        IconButton(iconName: .globe, onPress: onPress)
        IconButton(iconName: .menucard, onPress: onPress)
        Spacer()
    }
    .padding(16)
}
