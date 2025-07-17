//
//  LetterView.swift
//  ScrambledWords
//
//  Created by Purnasindhu-749 on 18/07/25.
//

import SwiftUI

// A reusable view that displays a single letter in the UI
struct LetterView: View {
    let letter: Letter  // A Letter model containing text and ID
    var body: some View {
        Text(letter.text)
            .font(.system(size: 15,weight: .semibold))
            .foregroundStyle(.white)
            .frame(width: 30,height:30)
            .background(.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}
