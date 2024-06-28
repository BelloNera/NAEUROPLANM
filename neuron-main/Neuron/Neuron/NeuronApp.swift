//
//  NeuronApp.swift
//  Neuron
//
//  Created by student on 05.02.2024..
//

import SwiftUI

@main
struct NeuronApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                

                
            }
        }
        .modelContainer(for: Task.self)
    }
}
