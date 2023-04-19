//
//  RootNavigation.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation
import SwiftUI

struct RootNavigation: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }
    var body: some View {
        NavigationView {
            TabView {
                SearchScreen()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                FavoriteScreen()
                    .tabItem {
                        Image(systemName: "star")
                        Text("Favorite")
                    }
            }
        }
    }
}


struct RootNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RootNavigation()
    }
}
