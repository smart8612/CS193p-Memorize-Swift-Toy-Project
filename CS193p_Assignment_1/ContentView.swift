//
//  ContentView.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/10.
//

import SwiftUI

struct ContentView: View {
    let viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            title
            cardLayout
        }
    }
    
    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var cardLayout: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fill)
                        .onTapGesture() {
                            viewModel.choose()
                        }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
    }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if card.isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .padding()
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
