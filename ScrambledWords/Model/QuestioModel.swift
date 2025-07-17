//
//  QuestioModel.swift
//  ScrambledWords
//
//  Created by Purnasindhu-749 on 18/07/25.
//

import Foundation

// Model representing a single game question
struct Question {
    let image: String
    var screambledLetters: [Letter]      // Array of shuffled letters shown to the user
    let answer: String                   // The correct word to guess
}

// Extension adds a method to generate a fixed set of sample questions
extension Question {
    
    // Generates a static list of questions with images and scrambled letters
    static func generateQuestions() -> [Question] {
        return [
            Question(
                image: "orange",
                screambledLetters: [
                    Letter(id: 0, text: "R"),
                    Letter(id: 1, text: "O"),
                    Letter(id: 2, text: "G"),
                    Letter(id: 3, text: "N"),
                    Letter(id: 4, text: "A"),
                    Letter(id: 5, text: "E"),
                ],
                answer: "ORANGE"
            ),
            Question(
                image: "banana",
                screambledLetters: [
                    Letter(id: 0, text: "B"),
                    Letter(id: 1, text: "N"),
                    Letter(id: 2, text: "A"),
                    Letter(id: 3, text: "A"),
                    Letter(id: 4, text: "N"),
                    Letter(id: 5, text: "A"),
                ],
                answer: "BANANA"
            ),
            Question(
                image: "apple",
                screambledLetters: [
                    Letter(id: 0, text: "A"),
                    Letter(id: 1, text: "E"),
                    Letter(id: 2, text: "P"),
                    Letter(id: 3, text: "P"),
                    Letter(id: 4, text: "L"),
                ],
                answer: "APPLE"
            )
        ]
    }
}
