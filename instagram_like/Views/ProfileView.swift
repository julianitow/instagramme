//
//  ProfileView.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var showHome = false
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let lightBlueColor = Color(red: 36.0/255.0, green: 158.0/255.0, blue: 235.0/255.0, opacity: 1.0)
    
    var body: some View {
        if self.showHome {
            HomeView()
        } else {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    HStack {
                        Text("username")
                            .foregroundColor(lightBlueColor)
                            .fontWeight(.semibold)
                            .padding(.leading, 10)
                        Button(action: {
                            UserDefaults.standard.set(false, forKey: "already_signin")
                        }){
                            Image(systemName: "person.fill.xmark")
                                .resizable()
                                .frame(width: 25, height: 20)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }.padding()
                    }//HStack
                    .frame(height: 50)
                    .padding(.leading, 10)
                    HStack {
                        VStack {
                            Image("logo")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                                .overlay(Circle().stroke(Color.pink, lineWidth: 1))
                                                    
                        Text("Your Name")
                            .foregroundColor(lightBlueColor)
                            .fontWeight(.semibold)
                        }.padding(.leading, 10)
                        
                        VStack{
                            Text("10")
                                .font(.system(size: 30))
                                .foregroundColor(lightBlueColor)
                                .fontWeight(.bold)
                            
                            Text("Publications")
                                .font(.system(size: 13))
                                .foregroundColor(lightBlueColor)
                        }.padding(.leading, 30)
                        
                        VStack{
                            Text("100")
                                .font(.system(size: 30))
                                .foregroundColor(lightBlueColor)
                                .fontWeight(.bold)
                            
                            Text("Followers")
                                .font(.system(size: 13))
                                .foregroundColor(lightBlueColor)
                            }.padding()
                        VStack{
                            Text("1000")
                                .font(.system(size: 30))
                                .foregroundColor(lightBlueColor)
                                .fontWeight(.bold)
                            
                            Text("Following")
                                .font(.system(size: 13))
                                .foregroundColor(lightBlueColor)
                        }
                    }
                    .frame(height: 100)
                    .padding(.leading, 10)
                    
                    Button(action: {
                        
                    }){
                        Text("Edit Profile")
                            .fontWeight(.bold)
                            .foregroundColor(lightBlueColor)
                    }
                    .frame(width: 400)
                    .padding()
                    
                    Divider()
                    
                    TimelineView()
                    
                    Divider()
                    
                    HStack{
                        Button(action: {
                            self.showHome = true
                        }){
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }.padding()
                    
                        Spacer(minLength: 10)
                        
                        Button(action: {
                            self.showHome = false
                        }){
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }.padding()
                        
                    }.frame(height: 35)
                }//VStack
            } //GeometryReader
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
