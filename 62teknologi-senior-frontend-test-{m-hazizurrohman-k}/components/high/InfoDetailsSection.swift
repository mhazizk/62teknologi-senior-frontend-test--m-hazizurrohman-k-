//
//  Section.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 22/04/23.
//

import Foundation
import SwiftUI

/**
 this components contains 3 part : `business hours`, `location`, `phone` and `extra hours popup`
 */
struct InfoDetailsSection : View {
    var business:BusinessDetailsType
    @State private var showMoreHours = false
    @State private var sheetContentHeight = CGFloat(100)
    
    
    var body: some View {
        VStack {
            // Info
            HStack {
                Text("Info")
                    .bold()
                Spacer()
            }
            // Hours
            HStack{
                VStack {
                    HStack {
                        Text("Hours")
                            .bold()
                        Spacer()
                    }
                    if business.hours != nil {
                        OpenSchedule(schedule: business.hours![0].open,
                                     isOpenNow: business.hours![0].is_open_now
                        ).padding(.horizontal,-16)
                    } else {
                        HStack {
                            Text("No data").foregroundColor(.gray)
                            Spacer()
                        }.padding(.top,16)
                    }
                    
                }
                Spacer()
                if business.hours != nil {
                    Button(action:{
                        showMoreHours = true
                    }){
                        HStack {
                            Image(systemName: "list.bullet").frame(width: 20, height: 20)
                            Text("More")
                        }
                    }
                    .sheet(isPresented: $showMoreHours, onDismiss: {
                        showMoreHours = false
                    }) {
                        VStack (spacing: 4){
                            Text("Open hours").bold().padding(16)
                            VStack {
                                ForEach(0..<7) { i in
                                    let filteredSchedule = business.hours![0].open.filter({$0.day == i})
                                    
                                    if !filteredSchedule.isEmpty {
                                        let dayNumber = convertToSwiftWeekday(weekday: filteredSchedule[0].day)
                                        let isSameDay = (getTodaysDayOfTheWeekInt() - 1) == dayNumber
                                        HStack (alignment: .center){
                                            Text(getDayName(num:dayNumber)!).bold()
                                            if isSameDay && business.hours![0].is_open_now {
                                                PillTag(name: "Open", color: .green)
                                            }
                                            Spacer()
                                            VStack (alignment:.trailing){
                                                ForEach(filteredSchedule, id:\.start) {
                                                    schedule in
                                                    Text("\(timeFormatter(time: schedule.start)) - \(timeFormatter(time:schedule.end))")
                                                }
                                            }
                                        }.padding(.top,4)
                                        Color.gray.opacity(0.2).frame(height: 1)
                                    }
                                }
                            }
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
                
            }.padding(.top,8)
            
            Color.gray.opacity(0.2).frame(height: 1).padding(.vertical,16)
            
            // Location
            HStack{
                VStack {
                    HStack {
                        Text("Location")
                            .bold()
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading,spacing: 4) {
                            ForEach(business.location!.displayAddress, id:\.self) {
                                location in
                                Text(location)
                            }
                        }
                        Spacer()
                    }.padding(.top,8)
                }
                Spacer()
                Button(action:{
                        openMap(location: business.location?.displayAddress ?? [])
                }){
                    HStack {
                        Image(systemName: "map").frame(width: 20, height: 20)
                        Text("Map")
                    }
                }
                
            }
            
            Color.gray.opacity(0.2).frame(height: 1).padding(.vertical,16)
            
            // Phone
            HStack{
                VStack {
                    HStack {
                        Text("Phone")
                            .bold()
                        Spacer()
                    }
                    HStack {
                        Text(business.display_phone!)
                        Spacer()
                    }.padding(.top,8)
                }
                Spacer()
                Button(action: {
                    callPhoneNumber(number: business.phone!)
                }) {
                
                    HStack {
                            Image(systemName: "phone").frame(width: 20, height: 20)
                            Text("Call")
                    }
                    
                }
                
            }
            
            
        }
        .padding(16)
        
    }
}
