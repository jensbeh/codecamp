//
//  ContentView.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 07.11.23.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    var body: some View {
        NavigationView {
            VStack(content: {
                Text("Black Jack")
                NavigationLink(destination: {}) {
                    Text("Play")
                }.buttonStyle(.bordered)
                NavigationLink(destination: ResultView()) {
                    Text("Results")
                }.buttonStyle(.bordered)
            })
        }
    }
}

#Preview {
    MainView()
}
