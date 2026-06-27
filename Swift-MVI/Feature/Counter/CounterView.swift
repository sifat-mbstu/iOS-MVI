//
//  CounterView.swift
//  Swift-MVI
//
//  Created by Sifatul on 24/6/26.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var store: CounterStore
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(store.state.count)")
                .background()
                .frame(width: 334)
                .lineLimit(3)
                .frame(width: 334)
                .bold()
            
            if store.state.isLoading {
                ProgressView()
            }
            
            HStack {
                Button("-") {
                    store.send(.decrement)
                }
                
                Button("Reset") {
                    store.send(.reset)
                }
                
                Button("+") {
                    store.send(.increment)
                }
            }
            
            Button("Increment after 2s") {
                store.send(.incrementAfterDelay(seconds: 2))
            }
        }
        .padding()
    }
}
