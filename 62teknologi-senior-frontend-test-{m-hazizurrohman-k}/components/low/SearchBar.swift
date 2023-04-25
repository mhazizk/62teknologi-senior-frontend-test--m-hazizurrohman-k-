//
//  SearchBar.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 18/04/23.
//

import Foundation
import SwiftUI


struct SearchBar : View {
    var placeholder : String
    var iconName : String
    var location : String?
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
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                TextField(placeholder, text: $query, onCommit:onPressSearch)
                .autocorrectionDisabled()
                .submitLabel(.search)
                if location != nil {
                    ZStack {
                        Pill(name: location! ,color: .black,font: .subheadline)
                            .padding(.trailing,16)
                    }
                }
            }
            .background(.gray.opacity(0.2))
            .cornerRadius(8)
            .scaleEffect(x: 1.0, y: 1.0, anchor: .leading)
            .animation(.easeInOut(duration: 0.3), value: !query.isEmpty)

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
        }
        .padding(.horizontal,16)
        .padding(.vertical,4)
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
