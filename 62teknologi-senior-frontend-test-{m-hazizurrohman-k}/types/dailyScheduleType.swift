//
//  dailyScheduleType.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 24/04/23.
//

import Foundation


struct DailyScheduleType : Codable {
    let is_overnight : Bool
    let start : String
    let end : String
    let day : Int
}
