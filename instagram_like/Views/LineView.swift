//
//  LineView.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import SwiftUI

struct LineView: View {
    let previewArray:[Preview]
        
    var body: some View {
        HStack(spacing: 2){
            PreviewView(preview: previewArray[0])
            PreviewView(preview: previewArray[1])
            PreviewView(preview: previewArray[2])
        }
    }
}
