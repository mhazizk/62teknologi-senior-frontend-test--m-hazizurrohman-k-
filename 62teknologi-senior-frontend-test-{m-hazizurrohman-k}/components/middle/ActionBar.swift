//
//  ActionBar.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 22/04/23.
//

import Foundation
import SwiftUI

/**
 main action button to show on `BusinessDetailsScreen`
 */
func ActionBar(business:BusinessDetailsType) -> some View {
    let phone = business.phone
    let website = business.url
    let map = business.location?.address1
    
    
    func openWeb() -> Void {
        guard let url = URL(string: business.url!) else {return}
        return UIApplication.shared.open(url)
    }
    
    return HStack(spacing: 16) {
        Spacer()
        IconButton(iconName: .phone, onPress: {  callPhoneNumber(number: phone!)})
        IconButton(iconName: .map, onPress:  {openMap(location:business.location!.displayAddress)})
        IconButton(iconName: .globe, onPress: openWeb)
        Spacer()
    }
    .padding(16)
}





