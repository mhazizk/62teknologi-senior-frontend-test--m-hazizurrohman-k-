//
//  getDayName.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 24/04/23.
//

import Foundation

/**
 get day name in human readable string
 */
func getDayName(num: Int) -> String? {
  let weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday","Sunday"]
  let offset = num - 1
  guard offset >= 0 && offset < weekdays.count else {
    return nil
  }
  return weekdays[offset]
}
