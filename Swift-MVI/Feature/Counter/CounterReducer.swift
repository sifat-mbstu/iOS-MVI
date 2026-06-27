//
//  CounterReducer.swift
//  Swift-MVI
//
//  Created by Sifatul on 24/6/26.
//

import Foundation

struct Effect {
    let id: UUID = UUID()
    let run: (@escaping (CounterIntent) -> Void) -> Void
}

func counterReducer(state: CounterState,
                    intent: CounterIntent) -> (CounterState, [Effect]) {
    var newState = state
    var effects: [Effect] = []
    
    switch intent {
    case .increment:
        newState.count += 1
    case .decrement:
        newState.count -= 1
    case .reset:
        newState.count = 0
    case .incrementAfterDelay(let seconds):
        newState.isLoading = true
        let effect = Effect { callback in
            DispatchQueue.global().asyncAfter(deadline: .now() + seconds) {
                callback(.didFinishIncrement)
            }
        }
        effects.append(effect)
    case .didFinishIncrement:
        newState.isLoading = false
        newState.count += 1
    }
    
    return (newState, effects)
}
