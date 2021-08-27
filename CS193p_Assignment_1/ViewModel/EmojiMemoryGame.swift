//
//  EmojiMemoryGame.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    @Published private var gameModel = createMemoryGame()
    static private var theme = createMemoryTheme()
    
    var cards: [Card] { gameModel.cards }
    var score: Int { gameModel.score }
    var themeName: String { Self.theme.name }
    var themeColor: Color {
        switch Self.theme.color {
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "purple":
            return .purple
        case "yellow":
            return .yellow
        case "pink":
            return .pink
        default:
            return .gray
        }
    }
    
    // MARK: Intent Function
    
    func choose(_ card: Card) {
        gameModel.choose(card: card)
    }
    
    func restart() {
        Self.theme = MemoryTheme.themes.randomElement()!
        gameModel = Self.createMemoryGame()
    }
    
    private static func createMemoryTheme(_ theme: MemoryTheme? = nil) -> MemoryTheme {
        if let chosenTheme = theme {
            return chosenTheme
        } else {
            return MemoryTheme.themes.randomElement()!
        }
    }
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs, contents: theme.emojis)
    }
}
