//
//  InputView.swift
//  Neuron
//
//  Created by student on 09.02.2024..
//
/*
import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureFiled = false
    
    var body: some View {
        HStack(alignment: .center){
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            VStack(alignment: .leading, spacing: 1)
            {
                
                Text(title).foregroundColor(Color(.darkGray))
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .font(.footnote)
                
                if isSecureFiled{
                    SecureField(placeholder, text: $text)
                        .font(.system(size:20))
                }
                else{
                    TextField(placeholder, text: $text)
                        .font(.system(size:20))
                    
                }
            }
        }
    }}
#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "example")
}
*/
