//
//  InfoView.swift
//  Katakana
//

import SwiftUI
import CoreData

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let textSize: CGFloat = 16
    let studyRed = "Study"
    
    var body: some View {
        ZStack {
            // Add the background image
            Image("Faded BG")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.2)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                ScrollView {
                    Text("Welcome to the Japres Japanese Vocabulary Study Buddy App! This app has been created to bring a little enjoyment to learning Japanese. The study section contains vocabulary cards with anime characters and includes a Japanese word written in hiragana/katakana, kanji and romaji as well as the English meaning. You can choose from a range of topics and once you have learned each topic you can play the games to practise your Japanese knowledge. The games have been designed to allow you to play as soon as you have learned one topic. You can select the topic(s) you have learned at the start of each game and only the vocabulary related to those topics will appear in the games. Depending on your Japanese knowledge, you can choose to play each game in ‘romaji’ (English letters for each word) or in ‘kana’ (hiragana and katakana scripts). We hope by playing the games you will learn Japanese vocabulary easily and have fun while learning. \n\nA special thankyou to my friend, Atsuya for recording the authentic Japanese pronunciation audio files used throughout the app.\n\nFor more information, fun ideas and free resources, please visit www.japres.com.au")
                    .font(.custom("Comic Sans MS", size: textSize))
                    .frame(maxWidth: 350, alignment: .leading)
                    .foregroundColor(.white)
                } // close brace for scroll view
                
                Button(action: {
                    withAnimation {
                        self.presentationMode.wrappedValue.dismiss() // Dismiss the current view and go back to the main menu
                    }
                }) {
                    Text("Back to Main Menu") // Button to go back to the main menu
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.secondary)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20)
                }
            } // close brace for VStack
            .navigationBarTitle("Info", displayMode: .large) // Set the navigation bar title
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

