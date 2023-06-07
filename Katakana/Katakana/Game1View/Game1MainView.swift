//
//  Game1MainView.swift
//  Katakana
//
//  Created by Wally Carstensen on 1/6/2023.
//

import SwiftUI

struct Character1Group {
    let title: String
    let characters: [(String, String)]
}

struct Game1MainView: View {
    @State private var selectedGroup: Character1Group?
    
    let character1Groups: [Character1Group] = [
        Character1Group(title: "a - o", characters: [("ア", "A"), ("イ", "I"), ("ウ", "U"), ("エ", "E"), ("オ", "O")]),
        Character1Group(title: "ka - ko", characters: [("カ", "Ka"), ("キ", "Ki"), ("ク", "Ku"), ("ケ", "Ke"), ("コ", "Ko")]),
        Character1Group(title: "sa - to", characters: [("サ", "Sa"), ("シ", "Shi"), ("ス", "Su"), ("セ", "Se"), ("ソ", "So")]),
        Character1Group(title: "na - ho", characters: [("ナ", "Na"), ("ニ", "Ni"), ("ヌ", "Nu"), ("ネ", "Ne"), ("ノ", "No")]),
        Character1Group(title: "ma - n", characters: [("マ", "Ma"), ("ミ", "Mi"), ("ム", "Mu"), ("メ", "Me"), ("モ", "Mo"), ("ン", "N")]),
        Character1Group(title: "Tenten \n& Maru", characters: [
            ("ガ", "Ga"), ("ギ", "Gi"), ("グ", "Gu"), ("ゲ", "Ge"), ("ゴ", "Go"),
            ("ザ", "Za"), ("ジ", "Ji"), ("ズ", "Zu"), ("ゼ", "Ze"), ("ゾ", "Zo"),
            ("ダ", "Da"), ("デ", "De"), ("ド", "Do"), ("バ", "Ba"), ("ビ", "Bi"),
            ("ブ", "Bu"), ("ベ", "Be"), ("ボ", "Bo"), ("パ", "Pa"), ("ピ", "Pi"),
            ("プ", "Pu"), ("ペ", "Pe"), ("ポ", "Po")
        ]),
        Character1Group(title: "Combination Characters", characters: [
            ("キャ", "Kya"), ("キュ", "Kyu"), ("キョ", "Kyo"), ("シャ", "Sha"), ("シュ", "Shu"),
            ("ショ", "Sho"), ("チャ", "Cha"), ("チュ", "Chu"), ("チョ", "Cho"), ("ニャ", "Nya"),
            ("ニュ", "Nyu"), ("ニョ", "Nyo"), ("ヒャ", "Hya"), ("ヒュ", "Hyu"), ("ヒョ", "Hyo"),
            ("ビャ", "Bya"), ("ビュ", "Byu"), ("ビョ", "Byo"), ("ピャ", "Pya"), ("ピュ", "Pyu"),
            ("ピョ", "Pyo"), ("ミャ", "Mya"), ("ミュ", "Myu"), ("ミョ", "Myo"), ("リャ", "Rya"),
            ("リュ", "Ryu"), ("リョ", "Ryo")
        ])
    ]

    var body: some View {
            ZStack {
                // Background Image
                Image("Game 3 BG")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Game title
                    Text("Game 1")
                        .font(.custom("Comic Sans MS", size: 70))
                        .padding()

                    // Second heading
                    Text("Select Alphabet")
                        .font(.custom("Comic Sans MS", size: 40))
                        .padding()

                    // Start button
                    NavigationLink(destination: Game1ScreenView(selectedGroup: selectedGroup ?? Character1Group(title: "", characters: []))) {
                        Text("Start")
                            .font(.custom("Comic Sans MS", size: 40))
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(selectedGroup == nil)
                    .padding(.bottom)

                    
                    // Alphabet buttons
                    VStack {
                        ForEach(0..<character1Groups.count / 2) { index in
                            HStack {
                                ForEach(0..<2) { item in
                                    let group = character1Groups[index * 2 + item]
                                    
                                    Button(action: {
                                        selectedGroup = group
                                        print("\(group.title) tapped!")
                                    }) {
                                        Text(group.title)
                                            .padding()
                                            .font(.custom("Comic Sans MS", size: 20))
                                            .background(selectedGroup?.title == group.title ? Color.green : Color.gray)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        let lastGroup = character1Groups.last!
                        Button(action: {
                            selectedGroup = lastGroup
                            print("\(lastGroup.title) tapped!")
                        }) {
                            Text(lastGroup.title)
                                .padding()
                                .font(.custom("Comic Sans MS", size: 20))
                                .background(selectedGroup?.title == lastGroup.title ? Color.green : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }

                    Spacer()

                    // Bottom buttons: Menu & Info
                    HStack {
                        NavigationLink(destination: ContentView()) {
                            Text("Menu")
                                .padding()
                                .font(.custom("Comic Sans MS", size: 30))
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        NavigationLink(destination: Game1InfoView()) {
                            Text("Info")
                                .padding()
                                .font(.custom("Comic Sans MS", size: 30))
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.bottom)
                }
            }
        }
    }

