//
//  TopView.swift
//  instagram_like
//
//  Created by Julien Guillan on 01/02/2022.
//

import SwiftUI

struct TopView: View {
    
    let lightBlueColor = Color(red: 36.0/255.0, green: 158.0/255.0, blue: 235.0/255.0, opacity: 1.0)
    
    var body: some View {
        HStack {
            Button(action: {}){
                Image(systemName: "camera")
                    .resizable()
                    .frame(width: 35, height: 30)
            }.padding()

            Text("Instagramme")
                .font(.largeTitle)
                .foregroundColor(lightBlueColor)
                .fontWeight(.semibold)

            Spacer()

            Button(action: {}){
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 35, height: 30)
            }

            Button(action: {}){
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 30, height: 30)
            }.padding()

        }.frame(height: 50)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                StoryView()
                StoryView()
                StoryView()
                StoryView()
                StoryView()
                StoryView()
                StoryView()
            }
        }.frame(height: 70)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
