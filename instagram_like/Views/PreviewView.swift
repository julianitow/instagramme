//
//  PreviewView.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import SwiftUI

struct PreviewView: View {
    let preview: Preview
        
    var body: some View {
        Image(preview.imageUrl)
        .resizable()
        .frame(width: 136, height: 136)
    }
}
