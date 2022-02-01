//
//  HomeView.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var showProfile = false
    
    var body: some View {
        if self.showProfile {
            ProfileView()
        } else {
            GeometryReader { geometry in
                VStack {
                    TopView()
                    
                    Divider()
                    
                    TimelineDetailView()
                    
                    HStack{
                        Button(action: {
                            self.showProfile = false
                        }){
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }.padding()
                    
                        Spacer(minLength: 10)
                        
                        Button(action: {
                            self.showProfile = true
                        }){
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }.padding()
                        
                    }.frame(height: 35)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
