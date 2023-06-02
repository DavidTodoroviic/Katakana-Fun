//
//  Game4View.swift
//  Katakana
//
//  Created by Wally Carstensen on 10/5/2023.
//

import SwiftUI

struct GameButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct Game4MainView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background image
                Image("iStock-cave background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        // Start button
                        NavigationLink(destination: GameScreenView()) {
                            VStack {
                                Image("Start Button") // Replace with your start button image name
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150) // Adjust button size here
                            }
                        }
                        Spacer()
                    }
                    .padding(.bottom, 20)
                }
                .padding()
                
                // Cloud images
                GeometryReader { geometry in
                    Image("Cloud Thick")
                        .resizable()
                        .scaledToFit()
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                        .overlay(
                            Text("Match up the correct sound,\nKatakana character & Romaji\nto unlock the chest and\nclaim your treasure")
                                .font(.system(size: 20, weight: .bold))
                                .bold()
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .overlay(
                                    Capsule()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                        )
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.2)
                    
                    Image("Cloud Thin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.4, height: min(geometry.size.width, geometry.size.height) * 0.4)
                        .position(x: geometry.size.width * 0.2, y: geometry.size.height * 0.6)
                    
                    Image("Chest")
                        .resizable()
                        .scaledToFit()
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.4, height: min(geometry.size.width, geometry.size.height) * 0.4)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.6)
                }
            }
            
        
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Gold Rush!")
                            .font(.system(size: 40, weight: .bold))
                            .fontWeight(.bold)
                            .foregroundColor(.yellow)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
