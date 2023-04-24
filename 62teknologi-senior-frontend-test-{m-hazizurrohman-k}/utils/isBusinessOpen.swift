//
//  isBusinessOpen.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 24/04/23.
//

import Foundation


func isBusinessOpen(start: String, end: String) -> Bool {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HHmm"
    guard let startDate = dateFormatter.date(from: start),
          let endDate = dateFormatter.date(from: end) else {
        return false
    }
    let startTimeInterval = startDate.timeIntervalSinceNow
    let endTimeInterval = endDate.timeIntervalSinceNow
    return startTimeInterval < 0 && endTimeInterval > 0
}
