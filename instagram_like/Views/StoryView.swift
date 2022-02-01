//
//  StoryView.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        HStack{
            VStack {
                Image("logo")
                .resizable()
                .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    .overlay(Circle().stroke(Color.pink, lineWidth: 1))
                    
                Text("Story")
                    .font(.caption)
            }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
