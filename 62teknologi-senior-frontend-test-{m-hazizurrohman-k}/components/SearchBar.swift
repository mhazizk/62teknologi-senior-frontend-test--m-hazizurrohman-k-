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
    
    func startSearch() -> Void {
        return
    }
    
    func clearQuery() -> Void {
        return query = ""
    }
    
    var body: some View{
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .padding()
                TextField("Search places...",
                          text: $query)
                {
                    
                }
                .frame(height: 48)
                .autocorrectionDisabled()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
                    .scaleEffect(x: !query.isEmpty ? 1.0 : 1.0, y: 1.0, anchor: .leading)
                    .animation(.easeInOut(duration: 0.3), value: !query.isEmpty)
            )
            
            if !query.isEmpty {
                Button(action: clearQuery) {
                    Image(systemName: "xmark")
                        .foregroundColor(.red)
                        .frame(width: 24, height: 24)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                .animation(.easeInOut(duration: 0.3), value: !query.isEmpty)
            }
        }.padding()
    }
}


struct SearchBar_Preview : PreviewProvider {
    
    static var previews : some View {
        @State var query:String = ""
        SearchBar(query: $query)
    }
}
