//
//  convertToSwiftDateIntStyle.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 27/04/23.
//

import Foundation

/**
 convert day in the week from javascript into swift style
 e.g :
 
 `sunday = 0` and so on.
 */
func convertToSwiftWeekday(weekday: Int) -> Int {
    var convertedWeekday = weekday + 1
    if convertedWeekday > 7 {
        convertedWeekday -= 7
    }
    return convertedWeekday
}
