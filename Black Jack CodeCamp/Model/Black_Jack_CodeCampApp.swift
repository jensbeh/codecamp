//
//  Black_Jack_CodeCampApp.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 07.11.23.
//

import SwiftUI
import SwiftData

@main
struct Black_Jack_CodeCampApp: App {
    
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Game.self, CustomLocation.self, Deck.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
