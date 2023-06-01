//
//  GameInfoView.swift
//  Katakana
//
//  Created by Wally Carstensen on 1/6/2023.
//

import SwiftUI

import SwiftUI

struct Game1InfoView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("Game 1 Info full screen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .position(x: UIScreen.main.bounds.width/2 - 20, y: UIScreen.main.bounds.height/2)

                VStack {
                    // Game title
                    Text("How To Play")
                        .font(.largeTitle)
                        .padding()

                    Spacer()
                }
            }
        }
    }
}



