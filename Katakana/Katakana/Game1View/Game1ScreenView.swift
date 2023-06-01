//
//  Game1ScreenView.swift
//  Katakana
//
//  Created by Wally Carstensen on 1/6/2023.
//

import SwiftUI

struct Game1ScreenView: View {
    @State private var correctAnswer = Int.random(in: 0..<4)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionNumber = 1
    let selectedGroup: Character1Group
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            Image("DIAB Game Screen BG") // Replace "backgroundImage" with the actual image name
                .resizable()
                .scaledToFit()
                .scaleEffect(1.7) // Adjust the scale as desired
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                HStack(spacing: 20) {
                    Spacer()
                    Button(action: {
                        self.letterTapped(0)
                    }) {
                        Text(self.selectedGroup.characters[0].1)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.black)
                            .padding(10)
                    }
                }
                .padding(.horizontal, 45) // Button 0

                HStack(spacing: 20) {
                    Button(action: {
                        self.letterTapped(1)
                    }) {
                        Text(self.selectedGroup.characters[1].1)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.black)
                            .padding(10)
                    }
                    .padding(.horizontal, 25) // Button 1
                    .padding(.bottom, 50)
                    
                    Spacer()
                    
                    Button(action: {
                        self.letterTapped(2)
                    }) {
                        Text(self.selectedGroup.characters[2].1)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.black)
                            .padding(10)
                    }
                    .padding(.top, 150) // Button 2
                }
                .padding(.horizontal, 45)

                HStack(spacing: 20) {
                    Button(action: {
                        self.letterTapped(3)
                    }) {
                        Text(self.selectedGroup.characters[3].1)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.black)
                            .padding(10)
                    }
                    .padding(.horizontal, 45)
                    .padding(.top, 30) // Button 3
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                

                // Katakana character
                Text(selectedGroup.characters[correctAnswer].0)
                    .font(.system(size: 100, weight: .bold))
                    .padding(.top, 200)

                Spacer()
            }

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Quit")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }

    func letterTapped(_ index: Int) {
        if index == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }

    func askQuestion() {
        if questionNumber < selectedGroup.characters.count {
            correctAnswer = Int.random(in: 0..<4)
            questionNumber += 1
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
