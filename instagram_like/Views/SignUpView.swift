//
//  SignUpView.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var network: Network
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State private var showingAlert = false
    @State var message = Message()
    
    @State var signin = false
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let lightBlueColor = Color(red: 36.0/255.0, green: 158.0/255.0, blue: 235.0/255.0, opacity: 1.0)

    var body: some View {
        if self.signin {
            SignInView()
        } else {
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .shadow(radius: 5)
                Text("Sign Up")
                    .font(.largeTitle)
                    .foregroundColor(lightBlueColor)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                Button(action: {
                    let user = User(username: self.username, password: self.password, email: self.email)
                    network.signup(user: user) { user in
                        if user == nil {
                            self.message.alertTitle = "OUPS"
                            self.message.alertText = "Houston on a un problème !"
                            self.showingAlert = true
                        } else {
                            self.signin = true
                        }
                    }
                }){
                    Text("Sign Up!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                            .background(lightBlueColor)
                            .cornerRadius(15.0)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(message.alertTitle), message: Text(message.alertText), dismissButton: .default(Text("Ok")))
                }
                Button(action: {
                    self.signin = true
                }){
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(lightGreyColor)
                        .cornerRadius(15.0)
                }
            }.padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
