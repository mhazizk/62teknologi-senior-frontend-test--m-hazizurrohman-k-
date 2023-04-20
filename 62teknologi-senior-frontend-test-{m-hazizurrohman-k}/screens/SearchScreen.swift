//
//  BusinessScreen.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 18/04/23.
//

import Foundation
import SwiftUI

let defaultParams : [String] = ["location=singapore","term=","sort_by=best_match", "offset=0", "limit=20"]

struct SearchScreen : View {
    @State var showFilter = false
    @State var params : [String] = defaultParams
    @State var query : String = ""
    @State var offset : String = "offset=0"
    @State var data : [BusinessType] = []
    
    func searchBusiness() -> Void {
        let req = request(BaseURLOptions.searchBusiness, params: params, businessId: "nil")
        
        URLSession.shared.getAllBusiness(at: req, completion: {
            result in
            switch result {
            case .success(let fetched):
                data = fetched.businesses
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        return
        
    }
    
    func onPressSearch() -> Void {
        let removedParams = removeStringFromParams(params: params, stringToRemove: ["term="])
        var term = "term="
        if !query.isEmpty {
            term = term + query
        }
        params = addStringToParams(params: removedParams, stringToAdd: [term])
        searchBusiness()
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
            Spacer()
            CustomList(businesses: data)
        }
        .onAppear(){
            searchBusiness()
        }
    }
}


//struct BusinessScreen_Previews : PreviewProvider {
//    static var previews : some View {
//        SearchScreen()
//    }
//}
