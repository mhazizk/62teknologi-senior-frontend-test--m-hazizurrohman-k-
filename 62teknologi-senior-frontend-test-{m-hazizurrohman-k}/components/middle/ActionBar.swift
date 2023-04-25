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
    
    
    func openWeb() -> Void {
        guard let url = URL(string: business.url!) else {return}
        return UIApplication.shared.open(url)
    }

    func openMap() -> Void {
        return
    }
    
    return HStack(spacing: 16) {
        Spacer()
        IconButton(iconName: .phone, onPress: { phone in call(number: phone!)})
        IconButton(iconName: .map, onPress:  openMap)
        IconButton(iconName: .globe, onPress: openWeb)
        IconButton(iconName: .menucard, onPress: openMap)
        Spacer()
    }
    .padding(16)
}


func call(number:String) -> Void {
    guard let url = URL(string: "tel:\(number)") else { return }
    return UIApplication.shared.open(url)
}
