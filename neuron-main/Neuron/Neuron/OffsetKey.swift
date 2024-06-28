//
//  OffsetKey.swift
//  Neuron
//
//  Created by student on 05.02.2024..
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static let defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
