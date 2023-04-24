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
    @State var params : [String] = defaultParams
    @State var query : String = ""
    @State var offset : String = "offset=0"
    @State var data : [BusinessType] = []
    @State var isLoading : Bool = false
    @State var isFetched : Bool = false

    
    func onPressSearch() -> Void {
        let removedParams = removeStringFromParams(params: params, stringToRemove: ["term="])
        var term = "term="
        if !query.isEmpty {
            term = term + query
        }
        params = addStringToParams(params: removedParams, stringToAdd: [term])
        searchBusiness(isLoading: $isLoading, isFetched: $isFetched, data: $data, params: params)
        return
    }
    
    var body: some View {
        VStack {
            SearchBar(query: $query, params: $params, onPressSearch: onPressSearch)
            if !query.isEmpty {
                FilterBar(params: $params, applyFilter: onPressSearch)
                    .scaleEffect(x: 1.0, y: 1.0, anchor: .top)
                    .animation(.easeInOut(duration: 0.3), value: !query.isEmpty)
            }
            if isLoading {
                Spacer()
                ProgressView("Searching...")
                Spacer()
            } else {
                BusinessListSection(businesses: $data, params: params)
            }
        }
        .onAppear(){
            if !isFetched{
                searchBusiness(isLoading: $isLoading, isFetched: $isFetched, data: $data, params: params)
                
            }
        }
    }
}


//struct BusinessScreen_Previews : PreviewProvider {
//    static var previews : some View {
//        SearchScreen()
//    }
//}
