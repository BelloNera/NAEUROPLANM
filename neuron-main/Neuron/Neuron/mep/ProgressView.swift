//
//  ProgressView.swift
//  Neuron
//
//  Created by student on 08.02.2024..
//

import SwiftUI

struct ProgressView: View {
    @State private var tasks: [Task]
    
    init(tasks: [Task]) {
        self._tasks = State(initialValue: tasks)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                
                
            }
        }
    }
}
#Preview {
    ContentView()
}
