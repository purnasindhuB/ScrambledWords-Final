//
//  LetterModel.swift
//  ScrambledWords
//
//  Created by Purnasindhu-749 on 18/07/25.
//

import Foundation

// Model representing a single letter in the game
struct Letter: Identifiable, Hashable {
    let id: Int         // Unique identifier for the letter (used in ForEach and comparisons)
    var text: String    // The actual letter character, e.g., "A", "B", "C"
}
