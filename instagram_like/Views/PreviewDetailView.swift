//
//  PreviewDetailsView.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import SwiftUI

struct PreviewDetailView: View {
    
    let preview: Preview
    let lightBlueColor = Color(red: 36.0/255.0, green: 158.0/255.0, blue: 235.0/255.0, opacity: 1.0)
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    .overlay(Circle().stroke(Color.pink, lineWidth: 1))
                    .padding(.leading, 5)
                
                VStack(alignment: .leading){
                    Text("InstaNonOffical").font(.headline).foregroundColor(lightBlueColor)
                    Text("FYC").foregroundColor(Color(.lightGray)).font(.subheadline)
                }
                
                Spacer()
                
                Button(action: {}){
                    Image(systemName: "ellipsis")
                    .resizable()
                    .frame(width: 20, height: 5)
                }
                .padding(.trailing, 5)
            }
            
            Image(preview.imageUrl)
                .resizable()
                .frame(width: 415, height: 415)
            
            HStack {
                Button(action: {}){
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                }.padding(.leading, 5)
                
                Button(action: {}){
                    Image(systemName: "text.bubble")
                        .resizable()
                        .frame(width: 30, height: 30)
                }.padding(.leading, 5)
                
                Button(action: {}){
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 30, height: 30)
                }.padding(.leading, 5)
                
                Spacer()
                
                Button(action: {}){
                    Image(systemName: "flag")
                        .resizable()
                        .frame(width: 30, height: 30)
                }.padding(.trailing, 5)
            }
        }
    }
}

