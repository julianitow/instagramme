//
//  SigninView.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var network: Network
    
    @State var username: String = ""
    @State var password: String = ""
    @State private var showingAlert = false
    @State var message = Message()
    
    @State var signinSuccess = UserDefaults.standard.bool(forKey: "already_signin")
    
    @State var signup = false
        
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let lightBlueColor = Color(red: 36.0/255.0, green: 158.0/255.0, blue: 235.0/255.0, opacity: 1.0)
    
    var body: some View {
        if self.signinSuccess {
            HomeView()
        } else if self.signup {
            SignUpView()
        } else {
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .shadow(radius: 5)
                Text("Sign in")
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
                Button(action: {
                    if self.username.count == 0 || self.password.count == 0 {
                        self.message.alertTitle = "OUPS"
                        self.message.alertText = "Identifiants invalides"
                        self.showingAlert = true
                    } else {
                        let user = User(username: self.username, password: self.password)
                        network.signin(user: user) { user in
                            if user == nil {
                                self.message.alertTitle = "OUPS"
                                self.message.alertText = "Identifiants vides"
                                self.showingAlert = true
                                UserDefaults.standard.set(false, forKey: "already_signin")
                            } else {
                                print(self.signinSuccess)
                                self.signinSuccess = true
                                UserDefaults.standard.set(true, forKey: "already_signin")
                            }
                        }
                    }
                }) {
                    Text("Log In!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(lightBlueColor)
                        .cornerRadius(15.0)
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text(message.alertTitle), message: Text(message.alertText), dismissButton: .default(Text("Ok")))
                }
                
                Button(action: {
                    self.signup = true
                }){
                    Text("Sign up !")
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

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
