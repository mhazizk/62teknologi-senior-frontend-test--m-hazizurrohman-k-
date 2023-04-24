//
//  getTodaysDayOfTheWeekInt.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 24/04/23.
//

import Foundation

func getTodaysDayOfTheWeekInt() -> Int {
    let calendar = Calendar.current
    let dayOfWeek = calendar.component(.weekday, from: Date()) - 1
    return dayOfWeek
}
