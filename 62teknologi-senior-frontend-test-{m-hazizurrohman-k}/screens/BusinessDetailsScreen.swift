//
//  BusinessDetailsScreen.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 18/04/23.
//

import Foundation
import SwiftUI

func isDataAvailable(business:BusinessDetailsType?, reviews: BusinessReviewsType?) -> Bool {
    return business != nil && reviews != nil
}

struct BusinessDetailsScreen : View {
    @State private var isLoading : Bool = false
    @State private var businessDetailsData : BusinessDetailsType? = nil
    @State private var businessReviewsData : BusinessReviewsType? = nil
    var business : BusinessType
    
    
    var body: some View {
        
        VStack (alignment: .leading){
            if isLoading {
                Spacer()
                ProgressView("Searching...")
                Spacer()
            } else {
                if isDataAvailable(business: businessDetailsData, reviews: businessReviewsData) {
                    HeaderSection(distance:business.distance,business: businessDetailsData!)
                        .frame(maxHeight: 300)
                    ScrollView(.vertical) {
                        HStack(alignment: .center,spacing: 8) {
                            Text(businessDetailsData?.price ?? "$")
                            Text("•")
                            MapCategories(categories: businessDetailsData?.categories ?? [])
                            Spacer()
                        }
                        .padding(.horizontal,16)
                        .padding(.top,16)
                        if businessDetailsData?.hours != nil {
                            OpenSchedule(schedule: businessDetailsData!.hours![0].open,
                                         isOpenNow: businessDetailsData!.hours![0].is_open_now
                            )
                        }
                        Color.gray.opacity(0.2).frame(height: 1)
                        ActionBar(business: businessDetailsData!)
                        Color.gray.opacity(0.2).frame(height: 10)
                        InfoDetailsSection(business: businessDetailsData!)
                        Color.gray.opacity(0.2).frame(height: 10)
                        ReviewSection(reviews: businessReviewsData!.reviews)
                        Spacer()
                    }
                }
            }
            
        }
        .onAppear(){
            if businessDetailsData == nil {
                getBusinessById(isLoading: $isLoading,
                                businessId: business.id,
                                data: $businessDetailsData)
                getBusinessReviewsById(isLoading: $isLoading, businessId: business.id, data: $businessReviewsData)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

//struct BusinessDetailsScreen_Previews : PreviewProvider {
//    static var previews: some View {
//        BusinessDetailsScreen()
//    }
//}

