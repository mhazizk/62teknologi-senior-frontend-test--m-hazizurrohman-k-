//
//  FilterBar.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation
import SwiftUI

/**
 filter button component that also holds `filter popup`
 */
struct FilterButton : View {
    @Binding var params : [String]
    @State var price:[String]? = nil
    @State var isOpenNow : Bool = false
    @State private var showMoreFilterSheet = false
    @State private var showSortSheet = false
    @State private var selectedOption = "sort_by=best_match"
    @State private var sheetContentHeight = CGFloat(0)
    var applyFilter :() -> Void
    
    var body : some View {
            HStack(spacing: 8) {
                
                switch isParamsChanged(params: params) {
                case true:
                    Button(action: {
                        showMoreFilterSheet.toggle()
                    }) {
                        Image(systemName: "checklist")
                            .foregroundColor(.white)
                        Text("Filters")
                            .foregroundColor(.white)
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.borderedProminent)
                case false:
                    Button(action: {
                        showMoreFilterSheet.toggle()
                    }) {
                        Image(systemName: "checklist")
                        Text("Filters")
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.bordered)
                    
                }
                
            }
            .padding(.bottom,4)
            .sheet(isPresented: $showMoreFilterSheet) {
                VStack {
                    HStack{
                        Spacer()
                        Text("Filter")
                            .bold()
                        Spacer()
                    }
                    .padding(16)
                    
                        VStack(spacing: 20) {
                            HStack {
                                Text("Price")
                                Spacer()
                                HStack {
                                    ForEach(searchQueryPrice.sorted(by: <), id: \.key) { key, value in
                                        
                                        let isEnabled = params.contains(value)
                                        Button(action: {
                                            
                                            if isEnabled {
                                                params = removeStringFromParams(params: params, stringToRemove: [value])
                                            } else {
                                                params = addStringToParams(params: params, stringToAdd: [value])
                                            }
                                            
                                        }) {
                                            Text(key)
                                                .foregroundColor(isEnabled ? .white : .red)
                                                .cornerRadius(10)
                                        }
                                        .buttonStyle(.bordered)
                                        .background(isEnabled ? .red : .clear )
                                        .cornerRadius(8)
                                    }
                                }
                            }
                            FilterPicker(title: "Sort by", options: searchQuerySortBy, selected: $selectedOption)
                                .onChange(of: selectedOption) {
                                    newValue in
                                    let removedParams = removeStringFromParams(params: params, stringToRemove: ["sort_by="])
                                    params = addStringToParams(params: removedParams, stringToAdd: [newValue])
                                }
                            
                            Toggle("Open now", isOn: $isOpenNow)
                                .onChange(of: isOpenNow) { newValue in
                                    let removedParams = removeStringFromParams(params: params, stringToRemove: ["open_now="])
                                    if newValue {
                                        params = addStringToParams(params: removedParams,stringToAdd: ["open_now=true"])
                                    } else {
                                        params = addStringToParams(params: removedParams, stringToAdd: ["open_now=false"])
                                    }
                                }
                                .tint(.red)
                                .padding(.trailing,2)
                        }
                        
                    
                    
                    HStack (spacing: 16) {
                        if isParamsChanged(params: params) {
                                Button("Clear") {
                                    price = nil
                                    selectedOption = "sort_by=best_match"
                                    isOpenNow = false
                                    params = defaultParams
                                }
                                .buttonStyle(.bordered)
                                .tint(.red)
                                .scaledToFit()
                            }
                        Button("Apply Filters") {
                            showMoreFilterSheet = false
                            applyFilter()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        .scaledToFit()
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .bottom)
                    .padding(16)
                }
                .padding(16)
                .background {
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                sheetContentHeight = geometry.size.height
                            }
                    }
                }
                .presentationDetents([.height(sheetContentHeight)])
            }
            
        }
    }

