//
//  Game3ScreenView.swift
//  Katakana
//
//  Created by Ethan Tjan on 23/5/2023.
//

import SwiftUI
import AVFoundation
import Foundation
import Darwin

struct Game3ScreenView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var time_remaining = 120
    @State private var timer: Timer?
    @State private var score = 0
    @State private var total_balloons_popped = 0
    @State private var rand_indices: [Int] = []
    @State private var kata_indices: [Int] = []
    @State private var num_balloons = 3
    @State private var chosen_group_eng: [String] = []
    @State private var chosen_group_kata: [String] = []
    @State private var pressed_count = 0
    
    
    @State private var english = ["a", "e", "i", "o", "u"]
    @State private var kata = ["a-k", "e-k", "i-k", "o-k", "u-k"]
    
    var body: some View {
        // time's up screen
        if time_remaining == 120
        {
            VStack {
                Image("Start Button")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        // chosen group
                        chosen_group_eng = english
                        chosen_group_kata = kata
                        // randomise lists
                        randomise()
                        // (returns list of indices of random words chosen)
                        
                        //start timer
                        startTimer()
                    }
            }
        }
        if time_remaining == 0
        {
            ZStack {
                Image("GAME 3 END")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                // show score to user
                // have restart button that resets the timer to 120
            }
        }
        if time_remaining < 120 && time_remaining != 0
        {
            // play the game
           
            ZStack {
                // bg image
                Image("Game 3 BG")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.4)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    HStack{
                        //timer
                        Text(timeString(from: time_remaining))
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(20)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(40)
                        //score
                        Text("Score: \(score)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(20)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(40)
            
                    }
                    Spacer()
                        .frame(height: 110)
                    //var pressed_count = 0
                    let balloon_size: CGFloat = 120
                    
//                    Text(pressed_count % 2 == 0 && pressed_count > 0 ? "checking" : "doing nothing")
//                        .font(.custom("Comic Sans MS", size: 40))
                    
                    // row 1
                    HStack (spacing: 50){
                        
                        Image(english[rand_indices[0]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: balloon_size, height: balloon_size)
                            .onTapGesture {
                                pressed_count += 1
                                
                                randomise()
                                // make button sunken in or something
                                
                                // if pressed_count % 2 == 0 (even means two balloons have been pressed)
                                //      check local win
                                
                                
                            }
                        Image(kata[kata_indices[0]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: balloon_size, height: balloon_size)
                            .onTapGesture {
                                pressed_count += 1
                                
                            }
                    }
                    // row 2
                    HStack (spacing: 50){
                        
                        Image(english[rand_indices[1]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: balloon_size, height: balloon_size)
                            .onTapGesture {
                                pressed_count += 1
                                
                            }
                        Image(kata[kata_indices[1]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: balloon_size, height: balloon_size)
                            .onTapGesture {
                                pressed_count += 1
                                
                            }
                    }
                    // row 3
                    HStack (spacing: 50){
                        
                        Image(english[rand_indices[2]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: balloon_size, height: balloon_size)
                            .onTapGesture {
                                pressed_count += 1
                                
                            }
                        Image(kata[kata_indices[2]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: balloon_size, height: balloon_size)
                            .onTapGesture {
                                pressed_count += 1
                                
                            }
                    }
                    
                }
                
            }
        }
    }
    
    func randomise()
    {
        rand_indices = get_random_indices()
        kata_indices = rand_indices
        kata_indices.shuffle()
    }
    
    func check_valid_rand(num: Int, list: [Int]) -> Bool
    {
        for ele in list {
            if num == ele {
                // invalid
                return false
            }
        }
        // valid
        return true
    }
    
    func get_random_indices() -> [Int]
    {
        var indices: [Int] = []
        let max_index = chosen_group_eng.count
        var count = 0
        while count < num_balloons
        {
            // generate random num
            let rand_int = Int(arc4random_uniform(UInt32(max_index)))
            // check if valid random
            if check_valid_rand(num: rand_int, list: indices) {
                // valid
                indices.append(rand_int)
                count += 1
            } else {
                // try again
                continue
            }
        }
        return indices
    }
    
    //Start timer
    func startTimer() {
        time_remaining = 120 // Reset the timer to 2 minutes
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if time_remaining > 0 {
                time_remaining -= 1
            } else {
                timer.invalidate()
            }
        }
    }
    
    //Time remaining
    func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func playErrorSound() {
        guard let soundURL = Bundle.main.url(forResource: "Error", withExtension: "wav") else {
            print("Sound file not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    //play correct sound
    func playCorrectSound() {
        guard let soundURL = Bundle.main.url(forResource: "Win", withExtension: "wav") else {
            print("Sound file not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

struct Game3ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Game3ScreenView()
    }
}
