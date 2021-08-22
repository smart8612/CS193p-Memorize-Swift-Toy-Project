//
//  EmojiMemoryGame.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var gameModel: MemoryGame<String> = createMemoryGame()
    static private var theme: MemoryTheme = .vehicles
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs, contents: theme.emojis)
    }
    
    var cards: [MemoryGame<String>.Card] {
        return gameModel.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        gameModel.choose(card: card)
    }
    
}
