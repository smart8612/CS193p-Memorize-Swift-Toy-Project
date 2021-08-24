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
    
    var alreadyChosenIndex: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    init(numberOfPairsOfCards: Int, contents: [CardContent]) {
        self.cards = []
        for (index, each) in contents.enumerated() {
            cards.append(Card(content: each, id: index * 2))
            cards.append(Card(content: each, id: index * 2 + 1))
        }
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
                    score += 2
                } else {
                    score -= 1
                }
                cards[chosenIndex].isFaceUp = true
                
            } else {
                alreadyChosenIndex = chosenIndex
            }
            
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
