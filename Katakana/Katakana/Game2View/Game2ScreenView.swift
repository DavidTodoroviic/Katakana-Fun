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

struct Game2ScreenView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var score = 0
    @State private var kata_indices: [Int] = []
    @State private var num_shells = 5
    @State private var chosen_group_kata: [String] = []
    @State private var scale: [CGFloat] = [1.0, 1.0, 1.0, 1.0, 1.0]
    
    @State private var shell_size: CGFloat = 80
    @State private var shell_won: [Int] = [0, 0, 0, 0, 0] // if 1, shell has won and don't display it
    
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
    
    @State private var info_state = 1 // 1 to show info, 0 to be in game state
    
    //vibration feedback
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
                                            chosen_group_kata = a_english
                                        case "ha-ho":
                                            chosen_group_kata = h_english
                                        case "ka-ko":
                                            chosen_group_kata = k_english
                                        case "ma-n":
                                            chosen_group_kata = m_english
                                        case "na-no":
                                            chosen_group_kata = n_english
                                        case "sa-so":
                                            chosen_group_kata = s_english
                                        case "ta-to":
                                            chosen_group_kata = t_english
                                        case "tenten & maru":
                                            chosen_group_kata = tm_english
                                        case "Combination Characters":
                                            chosen_group_kata = combo_eng
                                        default:
                                            chosen_group_kata = a_english
                                        }
                                        // randomise lists
                                        kata_indices = get_random_indices()
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
        if score == 15
        {
            ZStack {
                Image("Game 2 win")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.3)
                VStack {
                    Text("Well done!")
                        .font(.custom("Comic Sans MS", size: 40))
                }
                .padding(.bottom, 105)
            }
        }
        
        if info_state == 0 && score < 15 {
            // gameplay
            ZStack {
                Image("Game 2 Game Screen")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.3)
                VStack(spacing: 30) {
                    // display score
                    //score
                    Text("Score: \(score)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(40)
                    
                    // spawn shells
                    HStack {
                        // row 1
                        
                    } // close brace for HStack 1
                    
                    HStack {
                        // row 2
                        
                    } // close brace for HStack 2
                    
                    HStack {
                        // row 3
                        
                    } // close brace for HStack 3
                    
                } // close brace for ZStack
            } // close brace for ZStack
        }
    }
    
    // FUNCTIONS
    
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
        let max_index = chosen_group_kata.count
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
