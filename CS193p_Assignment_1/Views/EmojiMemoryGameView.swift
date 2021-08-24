//
//  ContentView.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/10.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            title
            cardLayout
            bottom
        }
    }
    
    var title: some View {
        HStack {
            Text("Memorize!").font(.largeTitle)
            Text(game.themeName).font(.largeTitle)
        }
        .padding()
    }
    
    var cardLayout: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture() {
                            game.choose(card)
                        }
                }
            }
            .foregroundColor(game.themeColor)
            .padding(.horizontal)
        }
    }
    
    var bottom: some View {
        HStack {
            Spacer()
            Text("Score: \(game.score)")
                .font(.largeTitle)
            Spacer()
            Button(action: { game.restart() }) {
                Text("New Game").font(.largeTitle)
            }
            Spacer()
        }
        .padding()
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content)
                        .padding()
                        .font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        return .system(size: size.width * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}
