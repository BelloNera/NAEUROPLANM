import SwiftUI

struct LogIn: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var wrongPass = 0
    @State private var wrongUser = 0

  

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@gmail.com")
                      .autocapitalization(.none)
                      .background(.white)
                      .frame(maxWidth: .infinity, maxHeight: 50)
                      .overlay(
                            RoundedRectangle(cornerRadius: 10)
                              .stroke(Color.gray, lineWidth: 2)
                              .opacity(0.5)
                        )
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureFiled: true)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                      .background(.white)
                      .overlay(
                            RoundedRectangle(cornerRadius: 10)
                              .stroke(Color.gray, lineWidth: 2)
                              .opacity(0.8)
                    )
                    
                }.padding(.horizontal)
                  .padding(.top, 12)
                
                Button(action: {
                    self.login(email: email, password: password)
                }) {
                    HStack {
                        Text("SIGN IN")
                          .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                }.frame(width: 250, height: 35)
                  .background(.white)
                  .overlay(
                        RoundedRectangle(cornerRadius: 10)
                          .stroke(Color.gray, lineWidth: 2)
                          .opacity(0.9)
                    )
                
                if showError {
                    Text(errorMessage)
                       .foregroundColor(.red)
                }
                
                Spacer()
                
                NavigationLink(destination: ContentView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                NavigationLink {
                    RegistrationView()
                      .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Don't have an account?")
                    Text("Sign up").fontWeight(.bold)
                }
                
            }.background(Image("Bro").imageScale(.small)
              .clipShape(Circle())
              .frame(width: 10, height: 10))
              .opacity(0.6)
        }
    }

    func login(email: String, password: String) {
        if email.lowercased() == "helena@gmail.com" {
            wrongUser = 0
            if password == "abc123" {
                wrongPass = 0
                isLoggedIn = true // Successful login
            } else {
                wrongPass = 2
                showError = true
                errorMessage = "Wrong password."
            }
        } else {
            wrongUser = 2
            showError = true
            errorMessage = "User not found."
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
