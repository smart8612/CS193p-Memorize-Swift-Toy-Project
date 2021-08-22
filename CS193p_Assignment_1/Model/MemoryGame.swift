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
    var alreadyChosenIndex: Int?
    
    init(numberOfPairsOfCards: Int, contents: [CardContent]) {
        self.cards = Array<Card>()
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
                // 이미 따로 빼둔 카드가 존재하다면
                if cards[potentialChosenIndex].content == cards[chosenIndex].content {
                    cards[potentialChosenIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    self.score += 2
                    
                } else {
                    self.score -= 1
                    
                }
                
                alreadyChosenIndex = nil
                
            } else {
                // 내가 카드를 선택한 시점에서 이미 선택된 카드가 존재하지 않음
                // 모든 카드를 일단 뒤로 뒤집어둔 후에
                // 내가 선택한 카드 하나를 따로 빼둔다.
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                alreadyChosenIndex = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
            print("\(cards[chosenIndex])")
            
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
