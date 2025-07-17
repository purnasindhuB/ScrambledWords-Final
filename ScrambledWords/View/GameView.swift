//
//  ContentView.swift
//  ScrambledWords
//

import SwiftUI

// GameView is the main view where the scrambled word game happens.
struct GameView: View {
   
    // MARK: - State Variables
    @State private var guessedLetters: [Letter] = [] // Letters selected by user
    @State private var showSuccess = false           // Show success tick overlay
    @State private var showFailure = false           // Show failure cross overlay
    @State private var score = 0                     // Current score
    @State private var currentQuestionIndex = 0      // Tracks which question we're on
    @State private var showFinalScore = false        // Show final score screen
    
    @State var questions: [Question] = Question.generateQuestions() // Question list
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // MARK: - Background
                Color.background
                    .ignoresSafeArea()
                
                // MARK: - Main Game Content
                VStack {
                    VStack {
                        Spacer()
                        
                        // Question image
                        Image(questions[currentQuestionIndex].image)
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        Spacer()
                        
                        // Display guessed letters (answer in progress)
                        HStack {
                            ForEach(guessedLetters) { guessedLetter in
                                VStack {
                                    LetterView(letter: guessedLetter)
                                        .onTapGesture {
                                            // On tap, remove guessed letter and return it to scrambled list
                                            if let index = guessedLetters.firstIndex(of: guessedLetter) {
                                                guessedLetters.remove(at: index)
                                                questions[currentQuestionIndex]
                                                    .screambledLetters[guessedLetter.id]
                                                    .text = guessedLetter.text
                                            }
                                        }
                                    
                                    // Bottom underline under guessed letters
                                    Rectangle()
                                        .fill(.white)
                                        .frame(width: 25, height: 2)
                                }
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(width: proxy.size.width * 0.9, height: proxy.size.width * 0.9)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.border, lineWidth: 2)
                    }
                    
                    // MARK: - Score Label
                    Text("Score: \(score)")
                        .font(.system(size: 15))
                        .foregroundStyle(.white)
                        .padding(.top)
                    
                    // MARK: - Scrambled Letters Section
                    HStack {
                        ForEach(Array(questions[currentQuestionIndex].screambledLetters.enumerated()), id: \.1) { index, letter in
                            LetterView(letter: letter)
                                .onTapGesture {
                                    // On tap, move letter to guessed area
                                    if !letter.text.isEmpty {
                                        guessedLetters.append(letter)
                                        questions[currentQuestionIndex].screambledLetters[index].text = ""
                                        
                                        // Once all letters are guessed, check the answer
                                        if guessedLetters.count == questions[currentQuestionIndex].screambledLetters.count {
                                            let gussedAnswer = guessedLetters.map { $0.text }.joined()
                                            
                                            if gussedAnswer == questions[currentQuestionIndex].answer {
                                                // Correct answer flow
                                                showSuccess = true
                                                score += 1
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                    showSuccess = false
                                                    if currentQuestionIndex == questions.count - 1 {
                                                        showFinalScore = true // End game
                                                    } else {
                                                        currentQuestionIndex += 1 // Next question
                                                    }
                                                }
                                            } else {
                                                // Wrong answer flow
                                                showFailure = true
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                    showFailure = false
                                                    if currentQuestionIndex == questions.count - 1 {
                                                        showFinalScore = true // End game
                                                    } else {
                                                        currentQuestionIndex += 1 // Next question
                                                    }
                                                }
                                            }
                                            
                                            // Clear guessed letters after evaluation
                                            guessedLetters.removeAll()
                                        }
                                    }
                                }
                        }
                    }
                }
                
                // MARK: - Success Overlay
                if showSuccess {
                    VStack {
                        Image("tick")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3))
                }
                
                // MARK: - Failure Overlay
                if showFailure {
                    VStack {
                        Image("cross")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3))
                }
            }
        }
        // MARK: - Final Score Sheet
        .sheet(isPresented: $showFinalScore) {
            // Reset game when sheet is dismissed
            questions = Question.generateQuestions()
            currentQuestionIndex = 0
            score = 0
        } content: {
            // Show score and total questions
            ScoreView(score: score, questionCount: questions.count)
        }
    }
}

#Preview {
    GameView()
}
