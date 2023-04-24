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
//        UITabBar.appearance().bar
    }
    var body: some View {
        NavigationView {
            TabView {
                SearchScreen()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                CollectionScreen()
                    .tabItem {
                        Image(systemName: "bookmark.fill")
                        Text("Collections")
                    }
            }.accentColor(.red)
        }
    }
}


struct RootNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RootNavigation()
    }
}
