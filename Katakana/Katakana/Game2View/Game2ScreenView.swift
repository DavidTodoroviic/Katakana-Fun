//
//  Game2ScreenView.swift
//  Katakana
//
//  Created by Ethan Tjan on 2/6/2023.
//

import Foundation
import SwiftUI
import CoreData
import Darwin
import AVFoundation

struct Game2ScreenView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var score = 0
    @State private var index = 0
    @State private var kata_indices: [Int] = []
    @State private var num_shells = 5
    @State private var chosen_group_eng: [String] = []
    @State private var chosen_group_kata: [String] = []
    @State private var scale: [CGFloat] = [1.0, 1.0, 1.0, 1.0, 1.0]
    @State private var curr_guess: String = ""
    @State private var winner: String = ""
    @State private var shell_size: CGFloat = 80
    
    @State private var a_english = ["a", "e", "i", "o", "u"]
    @State private var a_kata = ["a-s", "e-s", "i-s", "o-s", "u-s"]
    
    @State private var h_english = ["fu", "ha", "he", "hi", "ho"]
    @State private var h_kata = ["fu-s", "ha-s", "he-s", "hi-s", "ho-s"]
    
    @State private var k_english = ["ka", "ke", "ki", "ko", "ku"]
    @State private var k_kata = ["ka-s", "ke-s", "ki-s", "ko-s", "ku-s"]
    
    @State private var m_english = ["ma", "me", "mi", "mo", "mu", "n", "ra", "re", "ri", "ro", "ru", "wa", "ya", "yo", "yu"]
    @State private var m_kata = ["ma-s", "me-s", "mi-s", "mo-s", "mu-s", "n-s", "ra-s", "re-s", "ri-s", "ro-s", "ru-s", "wa-s", "ya-s", "yo-s", "yu-s"]
    
    @State private var n_english = ["na", "ne", "ni", "no", "nu"]
    @State private var n_kata = ["na-s", "ne-s", "ni-s", "no-s", "nu-s"]
    
    @State private var s_english = ["sa", "se", "shi", "so", "su"]
    @State private var s_kata = ["sa-s", "se-s", "shi-s", "so-s", "su-s"]
    
    @State private var t_english = ["chi", "ta", "te", "to", "tsu"]
    @State private var t_kata = ["chi-s", "ta-s", "te-s", "to-s", "tsu-s"]
    
    @State private var tm_english = ["ba", "be", "bi", "bo", "bu", "da", "de", "do", "ga", "ge", "gi", "go", "gu", "ji", "pa", "pe", "pi", "po", "pu", "za", "ze", "zo", "zu"]
    @State private var tm_kata = ["ba-s", "be-s", "bi-s", "bo-s", "bu-s", "da-s", "de-s", "do-s", "ga-s", "ge-s", "gi-s", "go-s", "gu-s", "ji-s", "pa-s", "pe-s", "pi-s", "po-s", "pu-s", "za-s", "ze-s", "zo-s", "zu-s"]
    
    @State private var combo_eng = ["bya", "byo", "byu", "cha", "cho", "chu", "gya", "gyo", "gyu", "hya", "hyo", "hyu", "ja", "jo", "ju", "kya", "kyo", "kyu", "mya", "myo", "myu", "nya", "nyo", "nyu", "pya", "pyo", "pyu", "rya", "ryo", "ryu", "sha", "sho", "shu"]
    @State private var combo_kata = ["bya-s", "byo-s", "byu-s", "cha-s", "cho-s", "chu-s", "gya-s", "gyo-s", "gyu-s", "hya-s", "hyo-s", "hyu-s", "ja-s", "jo-s", "ju-s", "kya-s", "kyo-s", "kyu-s", "mya-s", "myo-s", "myu-s", "nya-s", "nyo-s", "nyu-s", "pya-s", "pyo-s", "pyu-s", "rya-s", "ryo-s", "ryu-s", "sha-s", "sho-s", "shu-s"]
    
    @State private var info_state = 1 // 1 to show info, 0 to be in game state
    
    // vibration feedback
    let generator = UINotificationFeedbackGenerator()
    
    var body: some View {
        if info_state == 1
        {
            ZStack {
                // Add the background image
                Image("Game 2 Game Screen")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.3)
                VStack(spacing: 10) {
                    Image("Game 2 Info")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                        .scaleEffect(0.67)
                        .position(x: 250, y: 380)
                    HStack {
                        // Start button
                            VStack {
                                Image("Start Button")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
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
                                        kata_indices = get_random_indices()
                                        randomise() // also makes sure there is a correct option
                                        // init score
                                        score = 0
                                        // start the game
                                        info_state = 0
                                    } // tap gesture close brace
                            }
                        
                    }
                }
                .padding(.bottom, 30)
            }
        }
        if score == 10
        {
            ZStack {
                Image("Game 2 win")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.25)
                    .padding(.trailing, 40)
            }
        }
        
        if info_state == 0 && score < 10 {
            // gameplay
            ZStack {
                Image("Game 2 bg")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.3)
                    .padding(.trailing, 600)
                VStack(spacing: 30) {
                    // display score
                    //score
                    Text("Score: \(score)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(10)
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(40)
                        .position(x: 780, y: 40)
                    
                    // spawn random charater from chosen group
                    Text("\(chosen_group_eng[index])")
                        .font(.custom("Comic Sans MS", size: 50))
                        .position(x: 892, y: -20)
                        .foregroundColor(.black)
                    
                    // spawn shells
                    HStack {
                        // row 1
                        Image(chosen_group_kata[kata_indices[0]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(scale[0])
                            .frame(height: shell_size)
                            .position(x: shell_size + 630, y: shell_size)
                            .onTapGesture {
                                generator.notificationOccurred(.success)
                                
                                withAnimation {
                                    scale[0] = scale[0] == 1.0 ? 0.7 : 1.0
                                }
                                curr_guess = chosen_group_eng[kata_indices[0]]
                                check_win()
                            } // close brace for ontapgesture
                        
                        Image(chosen_group_kata[kata_indices[1]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(scale[1])
                            .frame(height: shell_size)
                            .position(x: shell_size, y: shell_size)
                            .onTapGesture {
                                generator.notificationOccurred(.success)
                                
                                withAnimation {
                                    scale[1] = scale[1] == 1.0 ? 0.7 : 1.0
                                }
                                curr_guess = chosen_group_eng[kata_indices[1]]
                                check_win()
                            } // close brace for ontapgesture
                    } // close brace for HStack 1
                    
                    HStack {
                        // row 2
                        Image(chosen_group_kata[kata_indices[2]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(scale[2])
                            .frame(height: shell_size)
                            .position(x: shell_size + 705, y: shell_size - 50)
                            .onTapGesture {
                                generator.notificationOccurred(.success)
                                
                                withAnimation {
                                    scale[2] = scale[2] == 1.0 ? 0.7 : 1.0
                                }
                                curr_guess = chosen_group_eng[kata_indices[2]]
                                check_win()
                            } // close brace for ontapgesture
                    } // close brace for HStack 2
                    
                    HStack {
                        // row 3
                        Image(chosen_group_kata[kata_indices[3]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(scale[3])
                            .frame(height: shell_size)
                            .position(x: shell_size + 630, y: shell_size - 100)
                            .onTapGesture {
                                generator.notificationOccurred(.success)
                                
                                withAnimation {
                                    scale[3] = scale[3] == 1.0 ? 0.7 : 1.0
                                }
                                curr_guess = chosen_group_eng[kata_indices[3]]
                                check_win()
                            } // close brace for ontapgesture
                        
                        Image(chosen_group_kata[kata_indices[4]])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(scale[4])
                            .frame(height: shell_size)
                            .position(x: shell_size, y: shell_size - 100)
                            .onTapGesture {
                                generator.notificationOccurred(.success)
                                
                                withAnimation {
                                    scale[4] = scale[4] == 1.0 ? 0.7 : 1.0
                                }
                                curr_guess = chosen_group_eng[kata_indices[4]]
                                check_win()
                            } // close brace for ontapgesture
                    } // close brace for HStack 3
                } // close brace for VStack
            } // close brace for ZStack
        }
    }
    
    // FUNCTIONS
    
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
    
    func check_win()
    {
        if curr_guess == winner {
            playCorrectSound()
            randomise()
            score += 1
            // reset scales array
            for i in 0..<5 {
                scale[i] = 1.0
            }
        } else {
            playErrorSound()
            randomise()
            // reset scales array
            for i in 0..<5 {
                scale[i] = 1.0
            }
        } // end of else
    }
    
    func randomise()
    {
        index = get_random_index() // this is the winning word
        
        // assign kata_indices[0] to this index
        kata_indices[0] = index
        
        // assign winner
        winner = chosen_group_eng[index]
        
        // shuffle kata_indices
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
    
    func get_random_index() -> Int
    {
        let max_index = chosen_group_eng.count
        return Int(arc4random_uniform(UInt32(max_index)))
    }
    
    func get_random_indices() -> [Int]
    {
        var indices: [Int] = []
        let max_index = chosen_group_eng.count
        var count = 0
        while count < num_shells
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
}

struct Game2ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Game2ScreenView()
    }
}
