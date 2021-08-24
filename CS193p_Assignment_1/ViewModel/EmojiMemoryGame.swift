//
//  EmojiMemoryGame.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    @Published private var gameModel: MemoryGame<String>
    static private var theme: MemoryTheme = createMemoryTheme()
    
    init(theme: MemoryTheme? = nil) {
        gameModel = Self.createMemoryGame()
        Self.theme = Self.createMemoryTheme(theme)
    }
    
    private static func createMemoryTheme(_ theme: MemoryTheme? = nil) -> MemoryTheme {
        if let chosenTheme = theme {
            return chosenTheme
        } else {
            return MemoryTheme.themes.randomElement() ?? .devices
        }
    }
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs, contents: theme.emojis.shuffled())
    }
    
    var cards: [Card] {
        return gameModel.cards
    }
    
    func choose(card: Card) {
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
    
    func getGameScore() -> Int {
        return gameModel.score
    }
    
    func reset() {
        Self.theme = MemoryTheme.themes.randomElement() ?? .devices
        gameModel = Self.createMemoryGame()
    }
    
}
