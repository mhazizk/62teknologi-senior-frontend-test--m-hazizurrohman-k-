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
    @State var locationQuery : String = ""
    @State var showingOfTotal : [Int] = [0,0]
    @State var data : [BusinessType] = []
    @State var isLoading : Bool = true
    @State var isFetched : Bool = false
    @State private var expandsSearchBar = false
    @FocusState private var focus:Bool
    
    func resetParams(
        params : [String],
        resetAllParamsToDefault:Bool = false,
        resetOffset:Bool = false,
        newParams : @escaping ([String]) -> Void
        
    ) {
        switch true {
        case resetOffset:
            let resetOffsetInParams = removeStringFromParams(params: params, stringToRemove: ["offset="])
            let addDefaultOffsetInParams = addStringToParams(params: resetOffsetInParams, stringToAdd: ["offset=0"])
            newParams(addDefaultOffsetInParams)
            break;
        case resetAllParamsToDefault:
            newParams(defaultParams)
            break;
        default:
            break;
        }
        
    }
    
    func onPressSearch() {
        expandsSearchBar = false
        let removedQueryParams = removeStringFromParams(params: params, stringToRemove: ["term="])
        let removedLocationParams = removeStringFromParams(params: removedQueryParams, stringToRemove: ["location="])
        if locationQuery.isEmpty {
            locationQuery = "Singapore"
        }
        let term = "term=" + query
        let location = "location=" + locationQuery
        params = addStringToParams(params: removedLocationParams, stringToAdd: [location, term])
        searchBusiness(isLoading: $isLoading,
                       isFetched: $isFetched,
                       data: $data,
                       totalFound: $showingOfTotal[1],
                       params: params)
    }
    
    
    
    var body: some View {
        VStack {
            // Main search bar
            if !expandsSearchBar {
                SearchBar(placeholder:"Search business...",
                          iconName:"magnifyingglass",
                          location: locationQuery == "" ? nil : locationQuery,
                          query: $query,
                          params: $params,
                          onPressSearch: onPressSearch)
                .onTapGesture {
                    withAnimation {
                        expandsSearchBar = true
                        focus = true
                    }
                }
            }
            if expandsSearchBar {
                // Business search bar
                SearchBar(placeholder:"Search business...",
                          iconName:"magnifyingglass",
                          query: $query,
                          params: $params,
                          onPressSearch: {
                            resetParams(params: params,
                                        resetOffset: true,
                                        newParams: {
                                            newParams in
                                            showingOfTotal = [0,0]
                                            params = newParams
                                            onPressSearch()
                                
                            })
                    
                })
                .focused($focus)
                // Location search bar
                SearchBar(placeholder:"in Singapore...",
                          iconName: "mappin.and.ellipse",
                          query: $locationQuery,
                          params: $params,
                          onPressSearch: {
                            resetParams(params: params,
                                        resetOffset: true,
                                        newParams: {
                                            newParams in
                                            showingOfTotal = [0,0]
                                            params = newParams
                                            onPressSearch()
                            })
                })
            }
            // Filter bar
            HStack {
                    if !data.isEmpty || !query.isEmpty {
                        FilterButton(params: $params, applyFilter: onPressSearch
                        )
                    }
                    Spacer()
            }
            .padding(.horizontal,16)
            .scaleEffect(x: 1.0, y: 1.0, anchor: .top)
            .animation(.easeInOut(duration: 0.3), value: !query.isEmpty)
            
            if isLoading {
                Spacer()
                ProgressView("Searching...")
                Spacer()
            } else {
                BusinessListSection(businesses: $data,
                                    params: params)
                if showingOfTotal[0] < showingOfTotal[1] {
                    PaginationBar(showingOfTotal: showingOfTotal,
                                  onPressPrevious: {
                                        let currentlyShowing = showingOfTotal[0]
                                        if currentlyShowing > 20 {
                                            let reduceOffset = currentlyShowing - 20
                                            let removeParams = removeStringFromParams(params: params, stringToRemove: ["offset="])
                                            let newParams = addStringToParams(params: removeParams, stringToAdd: ["offset=\(reduceOffset)"])
                                            params = newParams
                                            onPressSearch()
                                            showingOfTotal = [reduceOffset, showingOfTotal[1]]
                                        }
                                    },
                                  onPressNext: {
                                    let currentlyShowing = showingOfTotal[0]
                                    let totalFound = showingOfTotal[1]
                                    if currentlyShowing + 20 < totalFound {
                                        let increaseOffset = currentlyShowing + 20
                                        let removeParams = removeStringFromParams(params: params, stringToRemove: ["offset="])
                                        let newParams = addStringToParams(params: removeParams, stringToAdd: ["offset=\(increaseOffset)"])
                                        params = newParams
                                        onPressSearch()
                                        showingOfTotal = [increaseOffset, showingOfTotal[1]]
                                        }
                                    }
                    )
                }}
        }
        .onChange(of: showingOfTotal) {
            newValue in
            let initialOffset = newValue[0]
            print([initialOffset])
            if (initialOffset == 0 && !data.isEmpty) {
                showingOfTotal = [data.count, showingOfTotal[1]]
            }
        }
        .onAppear(){
            if !isFetched{
                searchBusiness(isLoading: $isLoading,
                               isFetched: $isFetched,
                               data: $data,
                               totalFound: $showingOfTotal[1],
                               params: params)

            }
        }
    }
}


//struct BusinessScreen_Previews : PreviewProvider {
//    static var previews : some View {
//        SearchScreen()
//    }
//}
