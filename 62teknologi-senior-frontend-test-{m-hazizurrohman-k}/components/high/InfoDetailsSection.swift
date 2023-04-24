//
//  Section.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 22/04/23.
//

import Foundation
import SwiftUI

struct InfoDetailsSection : View {
    var business:BusinessDetailsType
    @State var showMoreHours = false
    @State private var sheetContentHeight = CGFloat(0)
    
    var onPress: () -> Void {
        return { showMoreHours.toggle() }
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Info")
                    .bold()
                Spacer()
            }
            HStack{
                VStack {
                    HStack {
                        Text("Hours")
                            .bold()
                        Spacer()
                    }
                    HStack(spacing: 4) {
                        if business.is_closed {
                            Pill(name: "Closed", color: .red)
                        } else {
                            Pill(name: "Open", color: .green)
                        }
                        Spacer()
                    }
                }
                Spacer()
                Button(action:onPress){
                    HStack {
                        Image(systemName: "list.bullet").frame(width: 20, height: 20)
                        Text("More")
                    }
                }
                
            }
            
            Color.gray.opacity(0.2).frame(height: 1).padding(.vertical,16)
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
                HStack {
                    Image(systemName: "map").frame(width: 20, height: 20)
                    Text("Map")
                }
                
            }
            
            
        }
        .padding(16)
        .sheet(isPresented: $showMoreHours) {
            VStack (spacing: 4){
                Text("Open hours").bold().padding(16)
                ForEach(business.hours![0].open, id:\.day) {
                    hour in
                    let isSameDay = getTodaysDayOfTheWeekInt() == hour.day
                    HStack {
                        Text(getDayName(num: hour.day)!).bold()
                        if isSameDay && business.hours![0].is_open_now {
                            Pill(name: "Open", color: .green)
                        }
                        Spacer()
                        Text(timeFormatter(time:hour.start))
                        Text("-")
                        Text(timeFormatter(time:hour.end))
                    }
                    
                }
            }
            .padding(16)
            .background {
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            print("size = \(geometry.size.height)")
                            sheetContentHeight = geometry.size.height
                        }
                }
            }
            .presentationDetents([.height(sheetContentHeight)])
        }
    }
}
