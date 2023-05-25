//
//  Game1View.swift
//  Katakana
//

//

import SwiftUI
import CoreData

struct Game1View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var score = 0
    
    var body: some View {
        ZStack {
            // Add the background image
            Image("Katakana cards stars BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Game 1") // Title of the game
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("Score: \(score)") // Display the current score
                    .font(.title)
                    .foregroundColor(.white)
                
                Button(action: {
                    score += 1 // Increment the score when the button is tapped
                }) {
                    Text("Increment Score") // Button to increment the score
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
        .navigationBarTitle("Game 1", displayMode: .large) // Set the navigation bar title
    }
}

struct Game1View_Previews: PreviewProvider {
    static var previews: some View {
        Game1View()
    }
}
