//
//  Game2InfoView.swift
//  Katakana
//
//  Created by Ethan Tjan on 2/6/2023.
//

import SwiftUI
import CoreData

struct Game2InfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            // Add the background image
            Image("Game 2 Game Screen")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.2)
                //.edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                Image("Game 2 Info")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFill()
                    .scaleEffect(0.67)
                    .position(x: 250, y: 380)
                    //.frame(width: 400, height: 400)
                
                HStack {
                    // Start button
                    NavigationLink(destination: Game2ScreenView()) {
                        VStack {
                            Image("Start Button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                        }
                    }
                    
                }
            }
            .padding(.bottom, 30)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Game2InfoView_Previews: PreviewProvider {
    static var previews: some View {
        Game2InfoView()
    }
}

