//
//  FilterBar.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation
import SwiftUI


func addStringToParams(params:[String], stringToAdd:[String], avoidDuplicate:Bool = false) -> [String] {
    
    var existingParams = params
    
    if avoidDuplicate {
        existingParams =  removeStringFromParams(params: params, stringToRemove: stringToAdd)
    }
    let newParams = existingParams + stringToAdd
    return newParams
}

func removeStringFromParams(params:[String], stringToRemove:[String]) -> [String] {
    var newParams = params
    if stringToRemove.count == 1 {
        newParams = params.filter({!$0.contains(stringToRemove[0])})
    } else {
        newParams = params.filter({ !stringToRemove.contains($0)})
    }
    return newParams
}

func isParamsChanged(params:[String]) -> Bool {
    if params.count != defaultParams.count { return true }
    if params.count == defaultParams.count {
        let newParams = params.filter({defaultParams.contains($0)})
        print(newParams.count)
        if newParams.count == 0 {return false}
    }
    return false
}


struct FilterBar : View {
    @Binding var params : [String]
    @State var showMoreFilterSheet = false
    @State var showSortSheet = false
    @State var selectedOption = "sort_by=best_match"
    @State var price:[String]? = nil
    @State var isOpenNow : Bool = true
    @State var offset : Int = 0
    var applyFilter :() -> Void
    
    var body : some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                
                Spacer()
                
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
            .sheet(isPresented: $showMoreFilterSheet) {
                VStack {
                    HStack{
                        Text("Filter")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        Spacer()
                        Button(action: {
                            showMoreFilterSheet = false
                        }){
                            Image(systemName: "xmark.circle")
                        }
                        .frame(width: 24, height: 24)
                        .aspectRatio(contentMode: .fit)
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                    
                    ScrollView {
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
                                            
                                            print(params)
                                        }) {
                                            Text(key)
                                                .foregroundColor(isEnabled ? .white : .blue)
                                                .cornerRadius(10)
                                        }
                                        .buttonStyle(.bordered)
                                        .background(isEnabled ? .blue : .clear )
                                        .cornerRadius(8)
                                    }
                                }
                            }
                            FilterPicker(title: "Sort by", options: searchQuerySortBy, selected: $selectedOption)
                                .onChange(of: selectedOption) {
                                    newValue in
                                    let removedParams = removeStringFromParams(params: params, stringToRemove: ["sort_by"])
                                    params = addStringToParams(params: removedParams, stringToAdd: [newValue])
                                    print(params)
                                }
                            
                            Toggle("Open now", isOn: $isOpenNow)
                                .onChange(of: isOpenNow) { newValue in
                                    let removedParams = removeStringFromParams(params: params, stringToRemove: ["open_now=true","open_now=false"])
                                    if newValue {
                                        params = addStringToParams(params: removedParams,stringToAdd: ["open_now=true"])
                                    } else {
                                        params = addStringToParams(params: removedParams, stringToAdd: ["open_now=false"])
                                    }
                                    print(params)
                                }
                                .padding(.trailing,2)
                        }
                        
                    }
                    .presentationDetents([.medium])
                    .padding(.horizontal, 16)
                    
                    HStack (spacing: 16) {
                        if isParamsChanged(params: params) {
                            Button("Clear") {
                                params = defaultParams
                            }
                            .buttonStyle(.bordered)
                            .scaledToFit()
                        }
                        Button("Apply Filters") {
                            showMoreFilterSheet = false
                            applyFilter()
                        }
                        .buttonStyle(.borderedProminent)
                        .scaledToFit()
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .bottom)
                    .padding(16)
                }
            }
            
        }
    }
}
