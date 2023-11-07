//
//  Item.swift
//  Black Jack CodeCamp
//
//  Created by Jens Behmenburg on 07.11.23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
