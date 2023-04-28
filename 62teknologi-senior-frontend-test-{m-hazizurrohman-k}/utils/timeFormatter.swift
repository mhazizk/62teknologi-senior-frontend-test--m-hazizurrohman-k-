//
//  timeFormatter.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 24/04/23.
//

import Foundation

/**
 timeFormatter convert "HHmm" into "HH:mm"
 */
func timeFormatter(time:String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "HHmm"
    guard let date = inputFormatter.date(from: time) else {
        // handle invalid input time
        fatalError("Invalid input time format")
    }
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "HH:mm"
    let newTime = outputFormatter.string(from: date)
    return newTime
}
