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
                NavigationLink(destination: ResultView()) {
                    Text("TEST")
                }.buttonStyle(.bordered)
            })
        }
    }
}

#Preview {
    ()
}
