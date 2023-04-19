//
//  BusinessDetailsScreen.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 18/04/23.
//

import Foundation
import SwiftUI

struct BusinessDetailsScreen : View {
    var business : BusinessType
    var body: some View {
        VStack{
            Text(business.name)
            Text("Business Details")
        }
    }
}

//struct BusinessDetailsScreen_Previews : PreviewProvider {
//    static var previews: some View {
//        BusinessDetailsScreen()
//    }
//}

