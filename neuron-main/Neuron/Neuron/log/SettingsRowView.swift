//
//  SettingsRowView.swift
//  Neuron
//
//  Created by student on 10.02.2024..
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColour: Color
    
    var body: some View {
    
        
        HStack(spacing: 12){
            Image(systemName: imageName)
                .imageScale(.large).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(tintColour)
            
            Text(title)
                .font(.subheadline).foregroundColor(.black)
        }
        
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "Version", tintColour: Color(.systemGray))
}
