//
//  Game5ScreenView.swift
//  Katakana
//
//  Created by David Todorovic on 11/5/2023.
//

import SwiftUI
import AVFoundation



struct GameScreenView5: View {
 
    

    var body: some View {
        ZStack {
            // Add the background image
            Image("Game 5 game background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                
            
                
            
            VStack(spacing: 10) {
                HStack {
                    
                    
                    // Skip button
                    NavigationLink(destination: GameScreenView5()) {
                        VStack {
                            Image("Start Button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                        }
                    }
                }
            }
        }
    }
    

}
