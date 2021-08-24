//
//  InitView.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/22.
//

import SwiftUI

struct InitView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentView(game: viewModel)) {
                Text("New Game")
                    .font(.largeTitle)
            }
            .navigationBarTitle("Emoji Memorize Game")
        }
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        InitView(viewModel: game)
    }
}
