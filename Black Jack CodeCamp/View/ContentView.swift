//
//  ContentView.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 07.11.23.
//

import SwiftUI

struct ContentView: View {
    private let vm = MainMenueViewModel()
    
    
    var body: some View {
        NavigationView{
            MainMenu()
        }
    }
}

#Preview {
    ContentView()
}
