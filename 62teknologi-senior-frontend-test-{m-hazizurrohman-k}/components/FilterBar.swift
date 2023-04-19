//
//  FilterBar.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation
import SwiftUI


struct FilterBar : View {
    @Binding var params : [String]
    @State var showMoreFilterSheet = false
    @State var showSortSheet = false
    @State var selectedOption = "sort_by=best_match"
    @State var isOpenNow : Bool = true
    
    var body : some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                
                Button(action: {
                    showSortSheet.toggle()
                }) {
                    Image(systemName: "line.3.horizontal.decrease")
                    Text("Sort")
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                Button(action: {
                    showMoreFilterSheet.toggle()
                }) {
                    Image(systemName: "checklist")
                    Text("More Filters")
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.bordered)
                
                .sheet(isPresented: $showMoreFilterSheet) {
                    Text("Filter")
                        .foregroundColor(Color.blue)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding(.top,16)
                    ScrollView {
                        VStack(spacing: 20) {
                            Text("Price")
                            HStack {
                                ForEach(searchQueryPrice.sorted(by: <), id: \.key) { key, value in
                                    Button(action: {
                                        // Add your button action here
                                        print(value)
                                    }) {
                                        Text(key)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            FilterPicker(title: "Sort by", options: searchQuerySortBy, selected: $selectedOption)
                            Toggle("Open now", isOn: $isOpenNow)

                        }
                        .presentationDetents([.large])
                        .padding(16)
                        
                    }
                }
                
            }
            .padding()
            
        }
    }
}
