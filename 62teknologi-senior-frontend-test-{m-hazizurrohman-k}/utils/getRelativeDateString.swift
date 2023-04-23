//
//  getRelativeDate.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 23/04/23.
//

import Foundation


func getRelativeDateString(from dateString: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    guard let date = dateFormatter.date(from: dateString) else {
        return nil
    }
    
    let componentsFormatter = DateComponentsFormatter()
    componentsFormatter.unitsStyle = .full
    componentsFormatter.maximumUnitCount = 1
    
    return componentsFormatter.string(from: date, to: Date())! + " ago"
}
