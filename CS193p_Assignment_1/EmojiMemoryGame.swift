//
//  EmojiMemoryGame.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static var selectedTheme: Int = 0
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[selectedTheme][pairIndex]
        }
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    static var emojis = [
        ["🚀", "🚗", "🏍", "🚊", "✈️", "🚟", "🚝", "🛺", "🚐", "🚜"],
        ["⌚️", "📱", "💻", "🖥", "🖨", "💾", "📷", "🖱", "⌨️", "💡"],
        ["😀", "🥲", "😜", "😡", "🥺", "😳", "😎", "😄", "🥸", "😍"]
    ]
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
