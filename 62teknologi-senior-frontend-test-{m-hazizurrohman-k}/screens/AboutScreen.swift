//
//  FavoriteScreen.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 18/04/23.
//

import Foundation
import SwiftUI

struct AboutScreen : View {
    var body: some View {
        VStack{
            Spacer()
            Image("yelp_logo")
                .resizable()
                .scaledToFill()
                .frame(width: 86, height: 86)
            Text("Simple Yelp iOS Client").bold().padding(.top,16)
            Text("by Haziz")
            Text("© 2023").font(.subheadline)
            Spacer()
        }
    }
}

struct FavoriteScreen_Previews : PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
