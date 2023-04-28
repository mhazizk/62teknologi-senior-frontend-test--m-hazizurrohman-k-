//
//  getTodaysDayOfTheWeekInt.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 24/04/23.
//

import Foundation

/**
 get todays day of the week in swift int value
 eg:

 `sunday = 0` and so on.
 */
func getTodaysDayOfTheWeekInt() -> Int {
    let calendar = Calendar.current
    let dayOfWeek = calendar.component(.weekday, from: Date())
    return dayOfWeek
}
