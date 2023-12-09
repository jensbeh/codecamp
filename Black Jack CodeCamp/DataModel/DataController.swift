//
//  DataController.swift
//  Black Jack CodeCamp
//
//  Created by Noah Uni on 01.12.23.
//

import Foundation
import CoreData

class DataController:ObservableObject {
    let container = NSPersistentContainer(name: "GameModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("We could not save the data")
        }
    }
    
    func addNewDeck(deckId: String, remainingCards: Int16, context: NSManagedObjectContext){
        let deck =  Deck(context: context)
        deck.id=deckId
        deck.remainingCards=remainingCards
        save(context: context)
    }
    
    func updateDeck(deck:Deck, remainingCards: Int16, context: NSManagedObjectContext){
        deck.remainingCards=remainingCards
        save(context: context)
    }
    
    
    
    
    
}
