//
//  CounterIntent.swift
//  Swift-MVI
//
//  Created by Sifatul on 24/6/26.
//

import Foundation

enum CounterIntent {
    case increment
    case decrement
    case reset
    case incrementAfterDelay(seconds: TimeInterval) // Demonstrates Effect
    case didFinishIncrement // Action from an effect
}
