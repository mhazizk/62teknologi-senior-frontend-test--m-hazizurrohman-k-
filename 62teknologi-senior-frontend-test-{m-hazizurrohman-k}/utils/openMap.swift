//
//  openMap.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 27/04/23.
//

import Foundation
import SwiftUI

func openMap(location: [String]) {
    let address = location.joined(separator: " ")
    guard let encodedAddress = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
          let url = URL(string: "https://www.google.com/maps/search/?api=1&query=\(encodedAddress)") else {
        return
    }
    UIApplication.shared.open(url)
}
