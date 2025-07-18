# 🧠 ScrambledWords – SwiftUI Word Puzzle Game

ScrambledWords is a fun and minimal SwiftUI game where users unscramble letters to guess the correct word based on an image clue. It’s a great showcase of SwiftUI features, state management, and custom views.

---

## 📱 Features

- Tap-based letter guessing gameplay
- Dynamic image-based word puzzles
- Score tracking and final score summary
- Visual feedback on correct or incorrect answers
- Clean architecture with reusable components

---

## 🛠️ Tech Stack

- **SwiftUI** for UI
- **MVVM-inspired** modular structure
- **Custom Models** for `Letter` and `Question`
- Uses `Identifiable`, `Hashable` for dynamic SwiftUI lists

---

## 📂 Project Structure

ScrambledWords/
├── Models/
│ ├── LetterModel.swift # Defines the Letter struct (Identifiable & Hashable)
│ └── QuestionModel.swift # Defines the Question struct and static sample generator
│
├── Views/
│ ├── GameView.swift # Main game logic and UI
│ ├── LetterView.swift # Reusable letter box view
│ └── ScoreView.swift # Final score display
│
└── Assets/
└── (orange, banana, apple images + tick/cross icons)


---

## 🚀 How to Run

1. Open `ScrambledWords.xcodeproj` in Xcode.
2. Make sure your build target is **iOS 17.0+**.
3. Run the app on a simulator or real device.
4. Try to unscramble the word using the letters shown.

---

## 🔍 How It Works

- Each `Question` includes:
  - An `image` name (used in Assets)
  - A scrambled array of `Letter`
  - The correct `answer`
  
- User taps letters → they get appended to `guessedLetters`.

- Once all letters are guessed:
  - If the guess is correct: ✅ tick image shown, score increases.
  - If wrong: ❌ cross image shown.
  
- At the end of all questions, a `ScoreView` sheet is presented.

---

## ✅ Example Question

```swift
Question(
    image: "apple",
    screambledLetters: [
        Letter(id: 0, text: "A"),
        Letter(id: 1, text: "E"),
        Letter(id: 2, text: "P"),
        Letter(id: 3, text: "P"),
        Letter(id: 4, text: "L")
    ],
    answer: "APPLE"
)
```
## 👤 Author

Purnasindhu Bachu

📧 purnasindhubachu@gmail.com

🔗 GitHub Profile
