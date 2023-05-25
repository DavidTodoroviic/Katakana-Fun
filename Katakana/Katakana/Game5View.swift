//
//  Game5View.swift
//  Katakana
//

import SwiftUI
import CoreData

struct Game5View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isGameStarted = false
    
    var body: some View {
        ZStack {
            // Add the background image
            Image("Katakana cards stars BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Game 5") // Title of the game
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text(isGameStarted ? "Game Started" : "Game Not Started") // Display the game status
                    .font(.title)
                    .foregroundColor(.white)
                
                Button(action: {
                    isGameStarted.toggle() // Toggle the game status when the button is tapped
                }) {
                    Text(isGameStarted ? "End Game" : "Start Game") // Button to start or end the game
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
            }
        }
        .navigationBarTitle("Game 5", displayMode: .large) // Set the navigation bar title
    }
}

struct Game5View_Previews: PreviewProvider {
    static var previews: some View {
        Game5View()
    }
}
