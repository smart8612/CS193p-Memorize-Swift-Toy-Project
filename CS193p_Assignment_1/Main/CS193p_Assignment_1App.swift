//
//  CS193p_Assignment_1App.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/10.
//

import SwiftUI

@main
struct CS193p_Assignment_1App: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
