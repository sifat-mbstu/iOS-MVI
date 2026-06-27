//
//  Swift_MVIApp.swift
//  Swift-MVI
//
//  Created by Sifatul on 24/6/26.
//

import SwiftUI

@main
struct Swift_MVIApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(store: CounterStore())
        }
    }
}
