//
//  Game4View.swift
//  Katakana
//

//

import SwiftUI
import CoreData

struct Game4View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPlaying = false
    
    var body: some View {
        ZStack {
            // Add the background image
            Image("iStock-cave background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Game 4") // Title of the game
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                
                Text(isPlaying ? "Game in Progress" : "Game Not Started") // Display the game status
                    .font(.title)
                    .foregroundColor(.white)
                
                Button(action: {
                    isPlaying.toggle() // Toggle the game status when the button is tapped
                }) {
                    Text(isPlaying ? "Stop Game" : "Start Game") // Button to start or stop the game
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20)
                }
                
                Button(action: {
                    withAnimation {
                        self.presentationMode.wrappedValue.dismiss() // Dismiss the current view and go back to the main menu
                    }
                }) {
                    Text("Back to Main Menu") // Button to go back to the main menu
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.secondary)
                        .foregroundColor(.primary)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20)
                    
                    
                }
                
                Image("Chest") // second logo image name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
        }
        .navigationBarTitle("Game 4", displayMode: .large) // Set the navigation bar title
    }
}

struct Game4View_Previews: PreviewProvider {
    static var previews: some View {
        Game4MainView()
    }
}
