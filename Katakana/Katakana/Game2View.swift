//
//  Game2View.swift
//  Katakana
//

//

import SwiftUI
import CoreData

struct Game2View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var counter = 0
    
    var body: some View {
        ZStack {
            // Add the background image
            Image("Katakana cards stars BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Game 2") // Title of the game
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("Counter: \(counter)") // Display the current counter value
                    .font(.title)
                    .foregroundColor(.white)
                
                Button(action: {
                    counter += 1 // Increment the counter when the button is tapped
                }) {
                    Text("Increment Counter") // Button to increment the counter
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20)
                }
                 
                Button(action: {
                    if counter > 0 {
                        counter -= 1
                    } else {
                        
                    }
                })
                {
                    Text("Decrement Counter") // Button to decrement counter, so long as counter is greater than 0 so it doesn't go negative
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
        .navigationBarTitle("Game 2", displayMode: .large) // Set the navigation bar title
    }
}

struct Game2View_Previews: PreviewProvider {
    static var previews: some View {
        Game2View()
    }
}
