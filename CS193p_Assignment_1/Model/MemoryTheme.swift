//
//  MemoryTheme.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/22.
//

import Foundation

struct MemoryTheme {
    
    var name: String
    var numberOfPairs: Int {
        willSet {
            self.numberOfPairs = min(max(0, newValue), emojis.count)
        }
    }
    var color: String
    var emojis: Set<String>
    
    static var themes: [MemoryTheme] = [
        MemoryTheme(name: "Vehicle", numberOfPairs: 4, color: "red",
                    emojis: ["πΈ", "π", "π", "πΊ", "π ", "π΅", "π", "π", "π", "π»", "π"]),
        MemoryTheme(name: "Device", numberOfPairs: 10, color: "green",
                    emojis: ["βοΈ", "π±", "π»", "π₯", "π¨", "πΎ", "π·", "π±", "β¨οΈ", "π‘"]),
        MemoryTheme(name: "Face", numberOfPairs: 10, color: "blue",
                    emojis: ["π", "π₯²", "π", "π‘", "π₯Ί", "π³", "π", "π", "π₯Έ", "π"]),
        MemoryTheme(name: "Animal", numberOfPairs: 10, color: "purple",
                    emojis: ["πΆ", "π±", "π­", "πΉ", "π°", "π¦", "π»", "πΌ", "π»ββοΈ", "π¨"]),
        MemoryTheme(name: "Food", numberOfPairs: 10, color: "yellow",
                    emojis: ["π", "π", "π", "π", "π", "π", "π", "π", "π", "π₯"]),
        MemoryTheme(name: "Sport", numberOfPairs: 10, color: "pink",
                    emojis: ["β½οΈ", "π", "π", "βΎοΈ", "π₯", "πΎ", "πΎ", "π", "π", "π₯"]),
    ]
    
}
