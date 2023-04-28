//
//  searchQueryParams.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 19/04/23.
//

import Foundation

let searchQueryPrice: [String: String] = [
    "$": "price=1",
    "$$": "price=2",
    "$$$": "price=3",
    "$$$$":"price=4"]

let searchQuerySortBy: [String:String] = [
    "Best Match" : "sort_by=best_match",
    "Rating" : "sort_by=rating",
    "Review Count" : "sort_by=review_count",
    "Distance" : "sort_by=distance",
]

let searchQueryOpenNow : Bool = false
