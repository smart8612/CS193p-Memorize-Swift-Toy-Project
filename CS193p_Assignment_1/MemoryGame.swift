//
//  MemoryGame.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/20.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        self.cards = Array<Card>()
        for index in 0..<numberOfPairsOfCards {
            let content = createCardContent(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
    }
    
    func choose() {
        
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
