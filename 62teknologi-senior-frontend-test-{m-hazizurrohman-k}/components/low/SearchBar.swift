//
//  SearchBar.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 18/04/23.
//

import Foundation
import SwiftUI


struct SearchBar : View {
    
    @Binding var query:String
    @Binding var params:[String]
    var onPressSearch:()->Void
    
    func clearQuery() -> Void {
        params = defaultParams
        query = ""
        return
    }
    
    var body: some View{
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                TextField("Search places...", text: $query, onCommit:onPressSearch)
                .autocorrectionDisabled()
                .submitLabel(.search)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.secondary, lineWidth: 2)
                    .scaleEffect(x: 1.0, y: 1.0, anchor: .leading)
                    .animation(.easeInOut(duration: 0.3), value: !query.isEmpty)
            )
            
            if !query.isEmpty {
                Button(action: clearQuery) {
                    Image(systemName: "xmark")
                        .foregroundColor(.red)
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                .animation(.easeInOut(duration: 0.3), value: !query.isEmpty)
            }
        }.padding()
    }
}


//struct SearchBar_Preview : PreviewProvider {
//
//    static var previews : some View {
//        @State var query:String = ""
//        @State var params:[String] = []
//
//        SearchBar(query: $query, params: $params)
//    }
//}
