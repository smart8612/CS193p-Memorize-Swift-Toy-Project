//
//  MemoryGame.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/20.
//

import Foundation

struct MemoryGame<CardContent: Hashable> {
    private(set) var cards: [Card]
    private(set) var score = 0
    
    private var alreadyChosenIndex: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    init(numberOfPairsOfCards: Int, contents: Set<CardContent>) {
        cards = []
        contents.enumerated().forEach({
            cards.append(Card(content: $1, id: $0 * 2))
            cards.append(Card(content: $1, id: $0 * 2 + 1))
        })
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            
            if let potentialChosenIndex = alreadyChosenIndex,
               !cards[chosenIndex].isFaceUp,
               !cards[chosenIndex].isMatched
            {
                if cards[potentialChosenIndex].content == cards[chosenIndex].content {
                    cards[potentialChosenIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    addPrizeToScore()
                } else {
                    addPeneltyToScore()
                }
                cards[chosenIndex].isFaceUp = true
                
            } else {
                alreadyChosenIndex = chosenIndex
                
            }
            
        }
    }
    
    private mutating func addPeneltyToScore() {
        score -= 1
    }
    
    private mutating func addPrizeToScore() {
        score += 2
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? { count == 1 ? first : nil }
}
