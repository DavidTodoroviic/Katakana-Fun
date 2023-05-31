//
//  Game5MainView.swift
//  Katakana
//
//  Created by David Todorovic on 11/5/2023.
//

import SwiftUI

struct Game5MainView: View {
    var body: some View {
            ZStack {
                // Background image
                Image("Game 5 info background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        // Start button
                        NavigationLink(destination: GameScreenView5()) {
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
                
                // Info image
                GeometryReader { geometry in
                    Image("Game 5 info ")
                        .resizable()
                        .scaledToFit()
                        .frame(width: min(geometry.size.width, geometry.size.height) * 0.8, height: min(geometry.size.width, geometry.size.height) * 0.8)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.25)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                    ToolbarItem(placement: .principal) {
                            }
                        }
            .navigationBarBackButtonHidden(true)
                    }
                }
            
