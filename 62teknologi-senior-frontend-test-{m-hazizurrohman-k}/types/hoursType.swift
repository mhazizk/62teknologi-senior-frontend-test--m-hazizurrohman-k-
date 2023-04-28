//
//  hoursType.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 24/04/23.
//

import Foundation


struct HoursType : Codable {
    let open : [DailyScheduleType]
    let hours_type : String
    let is_open_now : Bool
}
