//
//  FilterList.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation
import SwiftUI

/**
 popup picker to show options
 */
struct FilterPicker : View {
    let title:String
    let options:[String:String]
    @Binding var selected : String
    
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            Picker(selection: $selected, label: Text(title)) {
                ForEach(options.sorted(by: <), id:\.key) { key, value in
                    Text(key).tag(value)
                }
            }
            .tint(.red)
            .pickerStyle(.menu)
            }
            
        }
    }
