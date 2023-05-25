//
//  Game3ScreenView.swift
//  Katakana
//
//  Created by Ethan Tjan on 23/5/2023.
//

import SwiftUI

struct Game3ScreenView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var timerValue = 0
    
    var body: some View {
        ZStack {
            // bg image
            Image("Game 3 BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                Spacer()
                Text("")
                    .font(.title)
                    .padding()
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                
                HStack {
                    
                }
            }
        }
    }
}
