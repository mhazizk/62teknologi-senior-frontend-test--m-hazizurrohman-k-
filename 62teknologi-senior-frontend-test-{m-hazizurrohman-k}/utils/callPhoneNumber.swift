//
//  call.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 27/04/23.
//

import Foundation
import SwiftUI

/**
 function to call business phone number
 */
func callPhoneNumber(number:String) -> Void {
    guard let url = URL(string: "tel:\(number)") else { return }
    return UIApplication.shared.open(url)
}
