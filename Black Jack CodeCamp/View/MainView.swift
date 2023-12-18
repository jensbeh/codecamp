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
        NavigationStack {
            VStack(content: {
                Text("Black Jack")
                NavigationLink(destination: {}) {
                    Text("Play")
                }.buttonStyle(.bordered)
                .accessibilityIdentifier("mainMenuButtonPlay")
                NavigationLink(destination: ResultView()) {
                    Text("Results")
                }.buttonStyle(.bordered)
                .accessibilityIdentifier("mainMenuButtonResults")
            })
        }.accessibilityIdentifier("mainMenuView")
    }
}

#Preview {
    MainView()
}
