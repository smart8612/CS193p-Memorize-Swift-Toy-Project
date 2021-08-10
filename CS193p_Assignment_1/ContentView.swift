//
//  ContentView.swift
//  CS193p_Assignment_1
//
//  Created by JeongTaek Han on 2021/08/10.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = [
        ["🚀", "🚗", "🏍", "🚊", "✈️", "🚟", "🚝", "🛺", "🚐", "🚜"],
        ["⌚️", "📱", "💻", "🖥", "🖨", "💾", "📷", "🖱", "⌨️", "💡"],
        ["😀", "🥲", "😜", "😡", "🥺", "😳", "😎", "😄", "🥸", "😍"]
    ]
    
    @State var selected = 0
    @State var cardCount = 10
    
    let column = [GridItem(.adaptive(minimum: 70))]
    
    var body: some View {
        VStack {
            title
            cardLayout
            bottom
        }
    }
    
    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var cardLayout: some View {
        ScrollView {
            LazyVGrid(columns: column) {
                ForEach(emojis[selected][0..<cardCount], id: \.self) { emoji in
                    CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fill)
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
    }
    
    var bottom: some View {
        HStack {
            Button(action: {
                selected = 0
                emojis[selected].shuffle()
                cardCount = Int.random(in: 4..<10)
                
            }, label: {
                VStack {
                    Image(systemName: "car")
                        .font(.largeTitle)
                    Text("Vehicle")
                        .font(.body)
                }
            }).padding()
            
            Button(action: {
                selected = 1
                emojis[selected].shuffle()
                cardCount = Int.random(in: 4..<10)
            }, label: {
                VStack {
                    Image(systemName: "applelogo")
                        .font(.largeTitle)
                    Text("Apple")
                        .font(.body)
                }
            }).padding()
            
            Button(action: {
                selected = 2
                emojis[selected].shuffle()
                cardCount = Int.random(in: 4..<10)
            }, label: {
                VStack {
                    Image(systemName: "person")
                        .font(.largeTitle)
                    Text("Human")
                        .font(.body)
                }
            }).padding()
        }
    }
}

struct CardView: View {
    @State var isFaceUp = true
    @State var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .padding()
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture() {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
