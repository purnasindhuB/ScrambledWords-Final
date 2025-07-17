//
//  ScoreView.swift
//  ScrambledWords
//
//  Created by Purnasindhu-749 on 18/07/25.
//

import SwiftUI

// A view that displays the final score after the game ends
struct ScoreView: View {
    let score: Int               // The number of correct answers
    let questionCount: Int       // Total number of questions
    
    var body: some View {
        ZStack {
            // Background color fills the entire screen
            Color.background
                .ignoresSafeArea()
            
            // Main content of the score screen
            VStack {
                Text("Final Score")  // Title text
                    .foregroundStyle(.white)
                    .font(.system(size: 26, weight: .bold))
                
                // Displays the score as "Score: X / Y"
                Text("Score: \(score) / \(questionCount)")
                    .foregroundStyle(.white)
            }
        }
    }
}

// Preview provider for SwiftUI Canvas
#Preview {
    ScoreView(score: 2, questionCount: 3)
}

