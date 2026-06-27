//
//  CounterState.swift
//  Swift-MVI
//
//  Created by Sifatul on 24/6/26.
//

import Foundation

struct CounterState: Equatable {
    var count: Int = 0
    var isLoading: Bool = false // example if UI flag
}
