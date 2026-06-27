//
//  CounterStore.swift
//  Swift-MVI
//
//  Created by Sifatul on 24/6/26.
//

import Foundation
import Combine

final class CounterStore: ObservableObject {
    @Published private(set) var state: CounterState
    
    private let reducer: (CounterState, CounterIntent) -> (CounterState, [Effect])
    private var effectCancellables: [UUID: Any] = [:]
    
    init(initialState: CounterState = CounterState(),
         reducer: @escaping (CounterState, CounterIntent) -> (CounterState, [Effect]) = counterReducer) {
        self.state = initialState
        self.reducer = reducer
    }
    
    func send(_ intent: CounterIntent) {
        let (newState, effects) = reducer(state, intent)
        
        DispatchQueue.main.async {
            self.state = newState
        }
        
        for effect in effects {
            
            effect.run { [weak self] returnedIntent in
                DispatchQueue.main.async {
                    self?.send(returnedIntent)
                }
                
            }
        }
    }
}
