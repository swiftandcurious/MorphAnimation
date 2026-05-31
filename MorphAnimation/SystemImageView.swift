//
//  SystemImageView.swift
//  MorphAnimation
//
//  Created by Karina Schreiber on 24/05/2026.
//

import SwiftUI

struct SystemImageView: View {
    @State private var toggle: Bool = false
    
    private var symbols: [String] {
        [
            "suit.heart.fill", "gamecontroller.fill", "bubble.left.and.bubble.right.fill", "person.2.fill", "video.fill", "moon.fill", "location.fill", "bookmark.fill", "cloud.fill", "flame.fill"
        ]
    }
    
    @State private var currentSymbolImage: String = "suit.heart.fill"
    @State private var nextSymbolImage: String = "suit.heart.fill"
    
    var body: some View {
        VStack {
            MorphingView(blurRadius: 40, toggle: toggle) {
                Image(systemName: currentSymbolImage)
                    .font(.system(size: 100))
            } to: {
                Image(systemName: nextSymbolImage)
                    .font(.system(size: 100))
            }
            .frame(height: 150)
            .frame(maxWidth: .infinity)
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
                ForEach(symbols, id: \.self) { symbol in
                    Button {
                        withAnimation(.interpolatingSpring(duration: 1.0, bounce: 0, initialVelocity: 0)) {
                            if !toggle {
                                nextSymbolImage = symbol
                            } else {
                                currentSymbolImage = symbol
                            }
                            toggle.toggle()
                        }
                    } label: {
                        Image(systemName: symbol)
                            .font(.title3)
                            .frame(height: 45)
                            .foregroundColor(Color.primary)
                            .frame(maxWidth: .infinity)
                            .background(.fill, in: .rect(cornerRadius: 10))
                            .contentShape(.rect)
                    }

                }
            }
            .padding(15)
        }
    }
}

#Preview {
    SystemImageView()
}
