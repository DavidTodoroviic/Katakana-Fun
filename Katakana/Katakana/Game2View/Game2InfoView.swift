//
//  Game2InfoView.swift
//  Katakana
//
//  Created by Ethan Tjan on 2/6/2023.
//

import SwiftUI
import CoreData
import Foundation

var chosen_group_game2: [String] = []

struct Game2InfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var chosen_group_kata: [String] = []
    
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
    
    
    var body: some View {
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
                    NavigationLink(destination: Game2ScreenView()) {
                        VStack {
                            Image("Start Button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                        }
                    }
                    
                }
            }
            .padding(.bottom, 30)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    // FUNCTIONS
    
}

struct Game2InfoView_Previews: PreviewProvider {
    static var previews: some View {
        Game2InfoView()
    }
}

