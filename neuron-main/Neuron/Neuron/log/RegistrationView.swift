
import SwiftUI

struct RegistrationView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var confirmpassword = ""
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                VStack{
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@gmail.com")
                    
                    .autocapitalization(.none)
                    .background(.white)
                    .frame(width: .infinity, height: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                            .opacity(0.5)
                    )
                    
                    InputView(text: $name,
                              title: "Enter your name",
                              placeholder: "someone")
                    
                    .autocapitalization(.none)
                    .background(.white)
                    .frame(width: .infinity, height: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                            .opacity(0.5)
                    )
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureFiled: true)
                    .frame(width: .infinity, height: .infinity)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                            .opacity(0.8)
                        
                    )
                    InputView(text: $confirmpassword,
                              title: "Confirm password",
                              placeholder: "Enter your password again")
                    
                    .autocapitalization(.none)
                    .background(.white)
                    .frame(width: .infinity, height: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                            .opacity(0.5)
                    )
                    
                }.padding(.horizontal)
                    .padding(.top,12)
                Spacer()
                
                Button{
                    
                }label:
                {
                    HStack{
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                }.frame(width: 250, height: 35).background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                            .opacity(0.9)
                        
                    )
                
                
                Spacer()
                
                
            }.background(Image("Bro").imageScale(.small)
                .clipShape(Circle())
                .frame(width: 10, height: 10))
            .opacity(0.7)
            Spacer()
            Button
            {dismiss()}label:{
                
                HStack{
                    Text("Already have an accoint?")
                    Text("SIGN IN")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")}
            }
            
        }
    }
}

#Preview {
    RegistrationView()
}
