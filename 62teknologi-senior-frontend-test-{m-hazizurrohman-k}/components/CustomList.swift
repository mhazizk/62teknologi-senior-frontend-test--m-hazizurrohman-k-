//
//  CustomList.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation
import SwiftUI

func CustomList(businesses:[BusinessType]) -> some View {

    return List(businesses) { business in
        NavigationLink(destination: BusinessDetailsScreen(business: business)) {
            HStack{
                Text(business.name)
            }
        }
        
    }
    
}

