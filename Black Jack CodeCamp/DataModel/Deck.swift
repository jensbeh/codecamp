//
//  Deck.swift
//  Black Jack CodeCamp
//
//  Created by Noah Uni on 02.12.23.
//

import Foundation
import SwiftData


@Model
class Deck {
    var deckId:String
    var remainingCards: Int16
    
    init(deckId: String, remainingCards: Int16) {
        self.deckId = deckId
        self.remainingCards = remainingCards
    }
    
}
