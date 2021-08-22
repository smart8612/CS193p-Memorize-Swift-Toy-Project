//
//  EmojiMemoryGame.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var gameModel: MemoryGame<String> = createMemoryGame()
    static private var theme: MemoryTheme = .devices
    
    init(theme: MemoryTheme? = nil) {
        if let chosenTheme = theme {
            Self.theme = chosenTheme
        } else {
            Self.theme = MemoryTheme.themes.randomElement() ?? .devices
        }
    }
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs, contents: theme.emojis.shuffled())
    }
    
    var cards: [MemoryGame<String>.Card] {
        return gameModel.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        gameModel.choose(card: card)
    }
    
    func getThemeName() -> String {
        return Self.theme.name
    }
    
    func getThemeColor() -> Color {
        switch Self.theme.color {
        case "red":
            return Color.red
        case "green":
            return Color.green
        case "blue":
            return Color.blue
        default:
            return Color.yellow
        }
    }
    
    func reset() {
        Self.theme = MemoryTheme.themes.randomElement() ?? .devices
        gameModel = Self.createMemoryGame()
    }
    
}
