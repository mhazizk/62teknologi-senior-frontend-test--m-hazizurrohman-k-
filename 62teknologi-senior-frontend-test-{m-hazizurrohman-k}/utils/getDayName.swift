//
//  getDayName.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 24/04/23.
//

import Foundation

func getDayName(num: Int) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    guard let date = Calendar.current.date(byAdding: .day, value: num, to: Date()) else {
        return nil
    }
    return dateFormatter.string(from: date)
}
