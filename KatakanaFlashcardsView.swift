import SwiftUI
import AVFoundation
import CoreData

struct CharacterGroup: Identifiable {
    let id = UUID()
    let title: String
    let characters: [(String, String)]
}

let characterGroups: [CharacterGroup] = [CharacterGroup(title: "a-o", characters: [("ア", "A"), ("イ", "I"), ("ウ", "U"), ("エ", "E"), ("オ", "O")]),
                                         CharacterGroup(title: "ka-ko", characters: [("カ", "Ka"), ("キ", "Ki"), ("ク", "Ku"), ("ケ", "Ke"), ("コ", "Ko")]),
                                         CharacterGroup(title: "sa-to", characters: [("サ", "Sa"), ("シ", "Shi"), ("ス", "Su"), ("セ", "Se"), ("ソ", "So")]),
                                         CharacterGroup(title: "na-ho", characters: [("ナ", "Na"), ("ニ", "Ni"), ("ヌ", "Nu"), ("ネ", "Ne"), ("ノ", "No")]),
                                         CharacterGroup(title: "ma-n", characters: [("マ", "Ma"), ("ミ", "Mi"), ("ム", "Mu"), ("メ", "Me"), ("モ", "Mo"), ("ン", "N")]),
                                         CharacterGroup(title: "Tenten & Maru", characters: [("ガ", "Ga"), ("ギ", "Gi"), ("グ", "Gu"), ("ゲ", "Ge"), ("ゴ", "Go"),("ザ", "Za"), ("ジ", "Ji"), ("ズ", "Zu"), ("ゼ", "Ze"), ("ゾ", "Zo"), ("ダ", "Da"), ("ヂ", "Ji"), ("ヅ", "Zu"), ("デ", "De"), ("ド", "Do"), ("バ", "Ba"), ("ビ", "Bi"), ("ブ", "Bu"), ("ベ", "Be"), ("ボ", "Bo"),("パ", "Pa"), ("ピ", "Pi"), ("プ", "Pu"), ("ペ", "Pe"), ("ポ", "Po")]),
                                         CharacterGroup(title: "Combination Characters", characters: [("キャ", "Kya"), ("キュ", "Kyu"), ("キョ", "Kyo"), ("シャ", "Sha"), ("シュ", "Shu"), ("ショ", "Sho"), ("チャ", "Cha"), ("チュ", "Chu"), ("チョ", "Cho"), ("ニャ", "Nya"), ("ニュ", "Nyu"), ("ニョ", "Nyo"), ("ヒャ", "Hya"), ("ヒュ", "Hyu"), ("ヒョ", "Hyo"), ("ミャ", "Mya"), ("ミュ", "Myu"), ("ミョ", "Myo"),("リャ", "Rya"), ("リュ", "Ryu"), ("リョ", "Ryo")])
]

struct MenuView: View {
    func getColor(index: Int) -> Color {
        let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .pink, .purple]
        return colors[index % colors.count]
    }

    var body: some View {
        NavigationView {
            ZStack {
                Image("Katakana cards stars BG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 10) {
                    ForEach(characterGroups.indices, id: \.self) { index in
                        NavigationLink(destination: KatakanaFlashcardsView(group: characterGroups[index])) {
                            Text(characterGroups[index].title)
                                .padding()
                                .frame(width: 180)
                                .background(getColor(index: index)) // Different color for each button
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding([.leading, .trailing], 20)
                    }
                    .navigationTitle("Katakana Groups")
                }
            }
        }
    }
}

        struct KatakanaFlashcardsView: View {
            @Environment(\.managedObjectContext) private var viewContext
            @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
            @State private var currentCharacter = ("", "")
            @State var soundPlayer: AVAudioPlayer?
            
            let group: CharacterGroup
            
            var body: some View {
                ZStack {
                    Image("Katakana cards stars BG")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 20) {
                        Text(currentCharacter.0)
                            .font(.system(size: 120))
                            .onAppear(perform: getRandomKatakanaCharacter)
                        
                        Text(currentCharacter.1)
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                        
                        Button(action: {
                            playAudio(named: "audioFile") // replace "audioFile" with the actual filename
                        }) {
                            Text("Pronunciation")
                        }
                        .padding()
                        .frame(width: 180)
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20)
                        
                        Button(action: getRandomKatakanaCharacter) {
                            Text("Next")
                                .padding()
                                .frame(width: 180)
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding([.leading, .trailing], 20)
                        }
                        
                        Button(action: {
                            withAnimation {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }) {
                            Text("Back to Main Menu")
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
                .navigationBarTitle("Katakana Flashcards", displayMode: .large)
            }
            
            func getRandomKatakanaCharacter() {
                let randomIndex = Int.random(in: 0..<group.characters.count)
                currentCharacter = group.characters[randomIndex]
            }
            
            func playAudio(named filename: String) {
                guard let url = Bundle.main.url(forResource: filename, withExtension: "mp3") else {
                    print("Unable to locate audio file")
                    return
                }
                
                do {
                    soundPlayer = try AVAudioPlayer(contentsOf: url)
                    soundPlayer?.play()
                } catch {
                    print("Audio playback failed: \(error)")
                }
            }
        }
        
    

