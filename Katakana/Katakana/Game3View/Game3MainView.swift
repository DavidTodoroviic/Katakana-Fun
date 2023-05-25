//
//  Game3MainView.swift
//  Katakana
//
//  Created by Ethan Tjan on 23/5/2023.
//

import SwiftUI
import CoreData

struct Game3MainView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            // Add the background image
            Image("Game 3 BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("Game 3 Info")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFill()
                    .scaleEffect(0.67)
                    .position(x: 275, y: 350)
                    //.frame(width: 400, height: 400)
                
                HStack {
                    Spacer()
                    
                    // Start button
                    NavigationLink(destination: Game3ScreenView()) {
                        VStack {
                            Image("Start Button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                            
                        }
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
            }
            .padding()
            
            VStack {
                
                Text("Balloon Bash!")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.pink)
                
            }
            .padding(.bottom, 620)
        }
    
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                
            }
        }
    }
}

struct Game3MainView_Previews: PreviewProvider {
    static var previews: some View {
        Game3MainView()
    }
}

