//
//  InfoView.swift
//  Katakana
//
//  Created by Wally Carstensen on 17/5/2023.
//
import SwiftUI

struct GameInfoView: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("Game 4 info")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitle("Information", displayMode: .inline)
    }
}


