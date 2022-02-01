//
//  ContentView.swift
//  instagram_like
//
//  Created by Julien Guillan on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State var alreadySignIn = UserDefaults.standard.bool(forKey: "already_signin")
    
    @EnvironmentObject var network: Network
    var body: some View {
        if self.alreadySignIn {
            HomeView()
        } else {
            SignInView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
