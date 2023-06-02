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
    
    @State private var time_remaining = 60
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
    @State private var loon_indices: [Int] = [] // for tracking last two loons tapped
    
    @State private var a_english = ["a", "e", "i", "o", "u"]
    @State private var a_kata = ["a-k", "e-k", "i-k", "o-k", "u-k"]
    
    @State private var h_english = ["fu", "ha", "he", "hi", "ho"]
    @State private var h_kata = ["fu-k", "ha-k", "he-k", "hi-k", "ho-k"]
    
    @State private var k_english = ["ka", "ke", "ki", "ko", "ku"]
    @State private var k_kata = ["ka-k", "ke-k", "ki-k", "ko-k", "ku-k"]
    
    @State private var m_english = ["ma", "me", "mi", "mo", "mu", "n", "ra", "re", "ri", "ro", "ru", "wa", "ya", "yo", "yu"]
    @State private var m_kata = ["ma-k", "me-k", "mi-k", "mo-k", "mu-k", "n-k", "ra-k", "re-k", "ri-k", "ro-k", "ru-k", "wa-k", "ya-k", "yo-k", "yu-k"]
    
    @State private var n_english = ["na", "ne", "ni", "no", "nu"]
    @State private var n_kata = ["na-k", "ne-k", "ni-k", "no-k", "nu-k"]
    
    @State private var s_english = ["sa", "se", "shi", "so", "su"]
    @State private var s_kata = ["sa-k", "se-k", "shi-k", "so-k", "su-k"]
    
    @State private var t_english = ["chi", "ta", "te", "to", "tsu"]
    @State private var t_kata = ["chi-k", "ta-k", "te-k", "to-k", "tsu-k"]
    
    @State private var tm_english = ["ba", "be", "bi", "bo", "bu", "da", "de", "do", "ga", "ge", "gi", "go", "gu", "ji", "pa", "pe", "pi", "po", "pu", "za", "ze", "zo", "zu"]
    @State private var tm_kata = ["ba-k", "be-k", "bi-k", "bo-k", "bu-k", "da-k", "de-k", "do-k", "ga-k", "ge-k", "gi-k", "go-k", "gu-k", "ji-k", "pa-k", "pe-k", "pi-k", "po-k", "pu-k", "za-k", "ze-k", "zo-k", "zu-k"]
    
    @State private var combo_eng = ["bya", "byo", "byu", "cha", "cho", "chu", "gya", "gyo", "gyu", "hya", "hyo", "hyu", "ja", "jo", "ju", "kya", "kyo", "kyu", "mya", "myo", "myu", "nya", "nyo", "nyu", "pya", "pyo", "pyu", "rya", "ryo", "ryu", "sha", "sho", "shu"]
    @State private var combo_kata = ["bya-k", "byo-k", "byu-k", "cha-k", "cho-k", "chu-k", "gya-k", "gyo-k", "gyu-k", "hya-k", "hyo-k", "hyu-k", "ja-k", "jo-k", "ju-k", "kya-k", "kyo-k", "kyu-k", "mya-k", "myo-k", "myu-k", "nya-k", "nyo-k", "nyu-k", "pya-k", "pyo-k", "pyu-k", "rya-k", "ryo-k", "ryu-k", "sha-k", "sho-k", "shu-k"]
    
    //vibration feedback
    let generator = UINotificationFeedbackGenerator()
    
    var body: some View {
        // start screen
        if time_remaining == 60
        {
            VStack {
                Text("Press start when ready!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(20)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(40)
                Image("Start Button")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        // chosen group
                        switch char_selection {
                        case "a-o":
                            chosen_group_eng = a_english
                            chosen_group_kata = a_kata
                        case "ha-ho":
                            chosen_group_eng = h_english
                            chosen_group_kata = h_kata
                        case "ka-ko":
                            chosen_group_eng = k_english
                            chosen_group_kata = k_kata
                        case "ma-n":
                            chosen_group_eng = m_english
                            chosen_group_kata = m_kata
                        case "na-no":
                            chosen_group_eng = n_english
                            chosen_group_kata = n_kata
                        case "sa-so":
                            chosen_group_eng = s_english
                            chosen_group_kata = s_kata
                        case "ta-to":
                            chosen_group_eng = t_english
                            chosen_group_kata = t_kata
                        case "tenten & maru":
                            chosen_group_eng = tm_english
                            chosen_group_kata = tm_kata
                        case "Combination Characters":
                            chosen_group_eng = combo_eng
                            chosen_group_kata = combo_kata
                        default:
                            chosen_group_eng = a_english
                            chosen_group_kata = a_kata
                        }
                        // randomise lists
                        randomise()
                        // init score
                        score = 0
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
                    Text("Score: \(score)")
                        .font(.custom("Comic Sans MS", size: 40))
                }
                .padding(.bottom, 105)
            }
        }
        if time_remaining < 60 && time_remaining != 0
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

                    // 3 rows of 2 balloons
                    ForEach(0..<3) { i in
                        HStack (spacing: 0){
                            if loons_won[i] == 0 {
                                Image(chosen_group_eng[rand_indices[i]])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(scale[i])
                                    .frame(width: balloon_size, height: balloon_size)
                                    .position(x: balloon_size * 1.6, y: balloon_size - 100)
                                    .onTapGesture {
                                        generator.notificationOccurred(.success)
                                        pressed_count += 1
                                        if guesses.contains(chosen_group_eng[rand_indices[i]]){
                                            guesses.removeAll{ $0 == chosen_group_eng[rand_indices[i]]}
                                            pressed_count -= 2
                                        } else {
                                            guesses.append(chosen_group_eng[rand_indices[i]])
                                        }
                                        if loon_indices.contains(i)
                                        {
                                            loon_indices.removeAll { $0 == i }
                                        } else {
                                            loon_indices.append(i)
                                        }
                                        withAnimation {
                                            scale[i] = scale[i] == 1.0 ? 0.7 : 1.0
                                        }
                                        check_local_win()
                                        check_global_win()
                                    }
                                
                            } // close brace for if
                            
                            if loons_won[i+3] == 0 && loons_won[i] == 0 {
                                    Image(chosen_group_kata[kata_indices[i]])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .scaleEffect(scale[i+3])
                                        .frame(width: balloon_size, height: balloon_size)
                                        .position(x: balloon_size * 0.6, y: balloon_size - 100)
                                        .onTapGesture {
                                            generator.notificationOccurred(.success)
                                            pressed_count += 1
                                            if guesses.contains(chosen_group_kata[kata_indices[i]]){
                                                guesses.removeAll{ $0 == chosen_group_kata[kata_indices[i]]}
                                                pressed_count -= 2
                                            } else {
                                                guesses.append(chosen_group_kata[kata_indices[i]])
                                            }
                                            if loon_indices.contains(i+3)
                                            {
                                                loon_indices.removeAll { $0 == i+3 }
                                            } else {
                                                loon_indices.append(i+3)
                                            }
                                            withAnimation {
                                                scale[i+3] = scale[i+3] == 1.0 ? 0.7 : 1.0
                                            }
                                            check_local_win()
                                            check_global_win()
                                        }
                            } // close brace for if
                            
                            else if loons_won[i+3] == 0 {
                                Image(chosen_group_kata[kata_indices[i]])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(scale[i+3])
                                    .frame(width: balloon_size, height: balloon_size)
                                    .position(x: balloon_size * 2.81, y: balloon_size - 100)
                                    .onTapGesture {
                                        generator.notificationOccurred(.success)
                                        pressed_count += 1
                                        if guesses.contains(chosen_group_kata[kata_indices[i]]){
                                            guesses.removeAll{ $0 == chosen_group_kata[kata_indices[i]]}
                                            pressed_count -= 2
                                        } else {
                                            guesses.append(chosen_group_kata[kata_indices[i]])
                                            loon_indices.append(i+3)
                                        }
                                        
                                        withAnimation {
                                            scale[i+3] = scale[i+3] == 1.0 ? 0.7 : 1.0
                                        }
                                        check_local_win()
                                        check_global_win()
                                    }
                            } // close brace for else if
                        } // close brace for HStack
                    } // close brace for loop
    
                } // close brace for VStack
                .padding(.bottom, 80)
                
            } // close brace for ZStack
        }
    }
    
    func check_global_win()
    {
        if loons_won.allSatisfy({ $0 == 1 }) {
            // add one to score
            score += 1
            // randomise
            randomise()
            // respawn loons
            for i in 0..<6 {
                loons_won[i] = 0
            }
            // reset scale array
            for i in 0..<6 {
                scale[i] = 1.0
            }
        }
    }
    
    func check_local_win()
    {
        // index is passed so loons_won can be updated
        if !scale.allSatisfy ({ $0 == 1.0 })
        {
            if pressed_count == 2
            {
                // check if two most recent items in guesses array are valid matches:
                
                let char1 = guesses[0]
                let char2 = guesses[1]
                let index1 = chosen_group_eng.firstIndex(of: char1)!
                let index2 = chosen_group_kata.firstIndex(of: char2)!
                let l_index1 = loon_indices[0]
                let l_index2 = loon_indices[1]
                if index1 == index2 {
                    // correct
                    playCorrectSound()
                    loons_won[l_index1] = 1
                    loons_won[l_index2] = 1 // remove loons from screen
                    pressed_count = 0
                    guesses.removeAll()
                    loon_indices.removeAll()
                } else {
                    // wrong
                    playErrorSound()
                    pressed_count = 0
                    scale[l_index1] = 1.0
                    scale[l_index2] = 1.0
                    guesses.removeAll()
                    loon_indices.removeAll()
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
        time_remaining = 60 // Reset the timer
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
