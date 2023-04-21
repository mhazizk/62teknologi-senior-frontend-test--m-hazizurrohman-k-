//
//  CategoryPill.swift
//  62teknologi-senior-frontend-test-{m-hazizurrohman-k}
//
//  Created by Haziz on 21/04/23.
//

import Foundation
import SwiftUI

func Pill(name:String, color:Color? = nil, font:Font? = nil) -> some View {
    return Text(name)
        .padding(4)
        .foregroundColor(color ?? .gray)
        .font(font ?? .footnote).lineLimit(1)
        .background(color?.opacity(0.15) ?? Color.gray.opacity(0.15))
        .cornerRadius(4)
}
