//
//  Buttons.swift
//  Neuron
//
//  Created by student on 09.02.2024..
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        
        VStack{
            Button {
                
            } label: {
                Text("Tasks")
                    .padding(20)
                    .contentShape(Rectangle()).background(.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .controlSize(.large)
            }
            
            Button {
                
            } label: {
                Text("")
                    .padding(20)
                    .contentShape(Rectangle()).background(.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .controlSize(.large)
            }
            Button {
                
            } label: {
                Text("Press Me")
                    .padding(20)
                    .contentShape(Rectangle()).background(.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .controlSize(.large)
                
            }.buttonStyle(.borderedProminent)
            
        }
    }}

#Preview {
    Buttons()
}
