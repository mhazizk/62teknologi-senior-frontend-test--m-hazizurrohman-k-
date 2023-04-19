//
//  BusinessScreen.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 18/04/23.
//

import Foundation
import SwiftUI

struct SearchScreen : View {
    @State var showFilter = false
    @State var params : [String] = []
    @State var query : String = "aa"
    @State var data : [BusinessType] = []
    
    var body: some View {
        VStack {
            SearchBar(query: $query)
            if !query.isEmpty {
                FilterBar(params: $params)
            }
            Spacer()
        }
    }
}


//struct BusinessScreen_Previews : PreviewProvider {
//    static var previews : some View {
//        SearchScreen()
//    }
//}
