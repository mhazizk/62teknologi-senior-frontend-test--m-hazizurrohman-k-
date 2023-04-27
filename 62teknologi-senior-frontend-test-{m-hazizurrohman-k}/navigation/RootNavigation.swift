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
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        NavigationView {
            TabView {
                SearchScreen()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                AboutScreen()
                    .tabItem {
                        Image(systemName: "info")
                        Text("About")
                    }
            }
            .accentColor(.red)
        
//            navigationController?.view.backgroundColor = .white
        }
    }
}


struct RootNavigation_Previews: PreviewProvider {
    static var previews: some View {
        RootNavigation()
    }
}
