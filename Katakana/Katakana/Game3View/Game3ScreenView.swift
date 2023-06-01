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
    @State private var guesses: [String] = []
    @State private var guesses_ind: [Int] = []
    @State private var scale: [CGFloat] = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
    @State private var balloon_size: CGFloat = 120
    @State private var loons_won: [Int] = [0, 0, 0, 0, 0, 0] // if 1, loon has won and don't display it
    
    @State private var english = ["a", "e", "i", "o", "u"]
    @State private var kata = ["a-k", "e-k", "i-k", "o-k", "u-k"]
    
    var body: some View {
        // start screen
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
                    .scaledToFill()
                    .scaleEffect(1.3)
                VStack {
                    //Text("\(rand_indices)")
                    Text("Score: \(score)")
                        .font(.custom("Comic Sans MS", size: 40))
                    HStack {
                        // ADD MENU BUTTON
                    }
                }
                .padding(.bottom, 105)
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
                    
                    HStack {
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
                        
                    } // close brace for HStack
                    Spacer()
                        .frame(height: 110)
                    Text("\(pressed_count)")
                        .font(.title)
                    if (guesses.count == 1){
                        Text("\(guesses[0])")
                            .font(.title)
                    }
                    if (guesses.count == 2){
                        Text("\(guesses[0]), \(guesses[1])")
                            .font(.title)
                    }
                    if (guesses.count == 3){
                        Text("\(guesses[0]), \(guesses[1]), \(guesses[2])")
                            .font(.title)
                    }

                    
                    
                    // 3 rows of 2 balloons
                    ForEach(0...2, id: \.self) { i in
                        HStack (spacing: 50){
                            if loons_won[i] == 0 {
                                Image(english[rand_indices[i]])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(scale[i])
                                    .frame(width: balloon_size, height: balloon_size)
                                    .onTapGesture {
                                        pressed_count += 1
                                        if guesses.contains(english[rand_indices[i]]){
                                            guesses.removeAll{ $0 == english[rand_indices[i]]}
                                            pressed_count -= 2
                                        } else {
                                            guesses.append(english[rand_indices[i]])
                                        }
                                        
                                        withAnimation {
                                            scale[i] = scale[i] == 1.0 ? 0.7 : 1.0
                                        }
//                                        check_local_win(row_index: 0, scale_index: 0)
                                        
                                    }
                            } // close brace for if
                            if loons_won[i+3] == 0 {
                                Image(kata[kata_indices[i]])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(scale[i+3])
                                    .frame(width: balloon_size, height: balloon_size)
                                    .onTapGesture {
                                        pressed_count += 1
                                        if guesses.contains(kata[kata_indices[i]]){
                                            guesses.removeAll{ $0 == kata[kata_indices[i]]}
                                            pressed_count -= 2
                                        } else {
                                            guesses.append(kata[kata_indices[i]])
                                        }
                                        
                                        withAnimation {
                                            scale[i+3] = scale[i+3] == 1.0 ? 0.7 : 1.0
                                        }
//                                        check_local_win(row_index: 0, scale_index: 1)
                                        
                                    }
                            } // close brace for if
                        } // close brace for HStack
                    } // close brace for loop
//                        HStack (spacing: 50){
//                            if loons_won[0] == 0 {
//                                Image(english[rand_indices[0]])
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .scaleEffect(scale[0])
//                                    .frame(width: balloon_size, height: balloon_size)
//                                    .onTapGesture {
//                                        pressed_count += 1
//                                        if guesses.contains(english[rand_indices[0]]){
//                                            guesses.removeAll{ $0 == english[rand_indices[0]]}
//                                            pressed_count -= 2
//                                        } else {
//                                            guesses.append(english[rand_indices[0]])
//                                        }
//
//                                        withAnimation {
//                                            scale[0] = scale[0] == 1.0 ? 0.7 : 1.0
//                                        }
//                                        check_local_win(row_index: 0, scale_index: 0)
//
//                                    }
//                            } // close brace for if
//                            if loons_won[1] == 0 {
//                                Image(kata[kata_indices[0]])
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .scaleEffect(scale[1])
//                                    .frame(width: balloon_size, height: balloon_size)
//                                    .onTapGesture {
//                                        pressed_count += 1
//                                        if guesses.contains(kata[kata_indices[0]]){
//                                            guesses.removeAll{ $0 == kata[kata_indices[0]]}
//                                            pressed_count -= 2
//                                        } else {
//                                            guesses.append(kata[kata_indices[0]])
//                                        }
//
//                                        withAnimation {
//                                            scale[1] = scale[1] == 1.0 ? 0.7 : 1.0
//                                        }
//                                        check_local_win(row_index: 0, scale_index: 1)
//
//                                    }
//                            } // close brace for if
//                        } // close brace for HStack 1
//                    // row 2
//                        HStack (spacing: 50){
//                            if loons_won[2] == 0 {
//                                Image(english[rand_indices[1]])
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .scaleEffect(scale[2])
//                                    .frame(width: balloon_size, height: balloon_size)
//                                    .onTapGesture {
//                                        pressed_count += 1
//                                        if guesses.contains(english[rand_indices[1]]){
//                                            guesses.removeAll{ $0 == english[rand_indices[1]]}
//                                            pressed_count -= 2
//                                        } else {
//                                            guesses.append(english[rand_indices[1]])
//                                        }
//
//                                        withAnimation {
//                                            scale[2] = scale[2] == 1.0 ? 0.7 : 1.0
//                                        }
//                                        check_local_win(row_index: 1, scale_index: 2)
//
//                                    }
//                            } // close brace for if
//                            if loons_won[3] == 0 {
//                                Image(kata[kata_indices[1]])
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .scaleEffect(scale[3])
//                                    .frame(width: balloon_size, height: balloon_size)
//                                    .onTapGesture {
//                                        pressed_count += 1
//                                        if guesses.contains(kata[kata_indices[1]]){
//                                            guesses.removeAll{ $0 == kata[kata_indices[1]]}
//                                            pressed_count -= 2
//                                        } else {
//                                            guesses.append(kata[kata_indices[1]])
//                                        }
//
//                                        withAnimation {
//                                            scale[3] = scale[3] == 1.0 ? 0.7 : 1.0
//                                        }
//                                        check_local_win(row_index: 1, scale_index: 3)
//
//                                    }
//                            } // close brace for if
//                        } // close brace for HStack 2
//
//                    // row 3
//                        HStack (spacing: 50){
//                            if loons_won[4] == 0 {
//                                Image(english[rand_indices[2]])
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .scaleEffect(scale[4])
//                                    .frame(width: balloon_size, height: balloon_size)
//                                    .onTapGesture {
//                                        pressed_count += 1
//                                        if guesses.contains(english[rand_indices[2]]){
//                                            guesses.removeAll{ $0 == english[rand_indices[2]]}
//                                            pressed_count -= 2
//                                        } else {
//                                            guesses.append(english[rand_indices[2]])
//                                        }
//
//                                        withAnimation {
//                                            scale[4] = scale[4] == 1.0 ? 0.7 : 1.0
//                                        }
//                                        check_local_win(row_index: 2, scale_index: 4)
//
//                                    }
//                            } // close brace for if
//                            if loons_won[5] == 0 {
//                                Image(kata[kata_indices[2]])
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .scaleEffect(scale[5])
//                                    .frame(width: balloon_size, height: balloon_size)
//                                    .onTapGesture {
//                                        pressed_count += 1
//                                        if guesses.contains(kata[kata_indices[2]]){
//                                            guesses.removeAll{ $0 == kata[kata_indices[2]]}
//                                            pressed_count -= 2
//                                        } else {
//                                            guesses.append(kata[kata_indices[2]])
//                                        }
//
//                                        withAnimation {
//                                            scale[5] = scale[5] == 1.0 ? 0.7 : 1.0
//                                        }
//                                        check_local_win(row_index: 2, scale_index: 5)
//                                    }
//                            } // close brace for if
//                        } // close brace for HStack 3
                
                } // close brace for VStack
                .padding(.bottom, 80)
                
            } // close brace for ZStack
        }
    }
    
    func check_local_win(row_index: Int, scale_index: Int)
    {
        // index is passed so loons_won can be updated
        if !scale.allSatisfy ({ $0 == 1.0 })
        {
            if pressed_count == 2
            {
                // check if two most recent items in guesses array are valid matches:
                
                var char1 = guesses[0]
                var char2 = guesses[1]
                let index1 = chosen_group_eng.firstIndex(of: char1)!
                let index2 = chosen_group_kata.firstIndex(of: char2)!
                
                if index1 == index2 {
                    // correct
                    playCorrectSound()
                    loons_won[row_index] = 1
                    pressed_count = 0
                    guesses.removeAll()
                } else {
                    // wrong
                    playErrorSound()
                    pressed_count = 0
                    scale[scale_index] = 1.0
                    guesses.removeAll()
                }
                
            }
        }
        // no balloons are sunken, so no win yet
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
        time_remaining = 120 // Reset the timer
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
