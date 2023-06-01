import SwiftUI
import AVFoundation
import CoreData

struct CharacterGroup: Identifiable {
    let id = UUID()
    let title: String
    let characters: [(String, String)]
}

let characterGroups: [CharacterGroup] = [
    CharacterGroup(title: "a-o", characters: [("ア", "A"), ("イ", "I"), ("ウ", "U"), ("エ", "E"), ("オ", "O")]),
    CharacterGroup(title: "ka-ko", characters: [("カ", "Ka"), ("キ", "Ki"), ("ク", "Ku"), ("ケ", "Ke"), ("コ", "Ko")]),
    CharacterGroup(title: "sa-so", characters: [("サ", "Sa"), ("シ", "Shi"), ("ス", "Su"), ("セ", "Se"), ("ソ", "So")]),
    CharacterGroup(title: "na-no", characters: [("ナ", "Na"), ("ニ", "Ni"), ("ヌ", "Nu"), ("ネ", "Ne"), ("ノ", "No")]),
    CharacterGroup(title: "ma-n", characters: [("マ", "Ma"), ("ミ", "Mi"), ("ム", "Mu"), ("メ", "Me"), ("モ", "Mo"), ("ン", "N")]),
    CharacterGroup(title: "Tenten & Maru", characters: [
        ("ガ", "Ga"), ("ギ", "Gi"), ("グ", "Gu"), ("ゲ", "Ge"), ("ゴ", "Go"),
        ("ザ", "Za"), ("ジ", "Ji"), ("ズ", "Zu"), ("ゼ", "Ze"), ("ゾ", "Zo"),
        ("ダ", "Da"), ("デ", "De"), ("ド", "Do"), ("バ", "Ba"), ("ビ", "Bi"),
        ("ブ", "Bu"), ("ベ", "Be"), ("ボ", "Bo"), ("パ", "Pa"), ("ピ", "Pi"),
        ("プ", "Pu"), ("ペ", "Pe"), ("ポ", "Po")
    ]),
    CharacterGroup(title: "Combination Characters", characters: [
        ("キャ", "Kya"), ("キュ", "Kyu"), ("キョ", "Kyo"), ("シャ", "Sha"), ("シュ", "Shu"),
        ("ショ", "Sho"), ("チャ", "Cha"), ("チュ", "Chu"), ("チョ", "Cho"), ("ニャ", "Nya"),
        ("ニュ", "Nyu"), ("ニョ", "Nyo"), ("ヒャ", "Hya"), ("ヒュ", "Hyu"), ("ヒョ", "Hyo"),
        ("ビャ", "Bya"), ("ビュ", "Byu"), ("ビョ", "Byo"), ("ピャ", "Pya"), ("ピュ", "Pyu"),
        ("ピョ", "Pyo"), ("ミャ", "Mya"), ("ミュ", "Myu"), ("ミョ", "Myo"), ("リャ", "Rya"),
        ("リュ", "Ryu"), ("リョ", "Ryo")
    ])
]


let allSoundOptions: [String: String] = [
    "ア": "a-o/1_A",
    "イ": "a-o/2_I",
    "ウ": "a-o/3_U",
    "エ": "a-o/4_E",
    "オ": "a-o/5_O",
    "カ": "ka-ko/6_KA",
    "キ": "ka-ko/7_KI",
    "ク": "ka-ko/8_KU",
    "ケ": "ka-ko/9_KE",
    "コ": "ka-ko/10_KO",
    "サ": "sa-to/11_SA",
    "シ": "sa-to/12_SHI",
    "ス": "sa-to/13_SU",
    "セ": "sa-to/14_SE",
    "ソ": "sa-to/15_SO",
    "タ": "sa-to/16_TA",
    "チ": "sa-to/17_CHI",
    "ツ": "sa-to/18_TSU",
    "テ": "sa-to/19_TE",
    "ト": "sa-to/20_TO",
    "ナ": "na-ho/21_NA",
    "ニ": "na-ho/22_NI",
    "ヌ": "na-ho/23_NU",
    "ネ": "na-ho/24_NE",
    "ノ": "na-ho/25_NO",
    "ハ": "na-ho/26_HA",
    "ヒ": "na-ho/27_HI",
    "フ": "na-ho/28_FU",
    "ヘ": "na-ho/29_HE",
    "ホ": "na-ho/30_HO",
    "マ": "ma-n/31_MA",
    "ミ": "ma-n/32_MI",
    "ム": "ma-n/33_MU",
    "メ": "ma-n/34_ME",
    "モ": "ma-n/35_MO",
    "ヤ": "ma-n/36_YA",
    "ユ": "ma-n/37_YU",
    "ヨ": "ma-n/38_YO",
    "ラ": "ma-n/39_RA",
    "リ": "ma-n/40_RI",
    "ル": "ma-n/41_RU",
    "レ": "ma-n/42_RE",
    "ロ": "ma-n/43_RO",
    "ワ": "ma-n/44_WA",
    "ン": "ma-n/45_N",
    "ガ": "tenten_maru/47_GA",
    "ギ": "tenten_maru/48_GI",
    "グ": "tenten_maru/49_GU",
    "ゲ": "tenten_maru/50_GE",
    "ゴ": "tenten_maru/51_GO",
    "ザ": "tenten_maru/52_ZA",
    "ジ": "tenten_maru/53_JI",
    "ズ": "tenten_maru/54_ZU",
    "ゼ": "tenten_maru/55_ZE",
    "ゾ": "tenten_maru/56_ZO",
    "ダ": "tenten_maru/57_DA",
    "デ": "tenten_maru/58_DE",
    "ド": "tenten_maru/59_DO",
    "バ": "tenten_maru/60_BA",
    "ビ": "tenten_maru/61_BI",
    "ブ": "tenten_maru/62_BU",
    "ベ": "tenten_maru/63_BE",
    "ボ": "tenten_maru/64_BO",
    "パ": "tenten_maru/65_PA",
    "ピ": "tenten_maru/66_PI",
    "プ": "tenten_maru/67_PU",
    "ペ": "tenten_maru/68_PE",
    "ポ": "tenten_maru/69_PO",
    "キャ": "combination characters/70_KYA",
    "キュ": "combination characters/71_KYU",
    "キョ": "combination characters/72_KYO",
    "ギャ": "combination characters/73_GYA",
    "ギュ": "combination characters/74_GYU",
    "ギョ": "combination characters/75_GYO",
    "シャ": "combination characters/76_SHA",
    "シュ": "combination characters/77_SHU",
    "ショ": "combination characters/78_SHO",
    "ジャ": "combination characters/79_JA",
    "ジュ": "combination characters/80_JU",
    "ジョ": "combination characters/81_JO",
    "チャ": "combination characters/82_CHA",
    "チュ": "combination characters/83_CHU",
    "チョ": "combination characters/84_CHO",
    "ニャ": "combination characters/85_NYA",
    "ニュ": "combination characters/86_NYU",
    "ニョ": "combination characters/87_NYO",
    "ヒャ": "combination characters/88_HYA",
    "ヒュ": "combination characters/89_HYU",
    "ヒョ": "combination characters/90_HYO",
    "ビャ": "combination characters/91_BYA",
    "ビュ": "combination characters/92_BYU",
    "ビョ": "combination characters/93_BYO",
    "ピャ": "combination characters/94_PYA",
    "ピュ": "combination characters/95_PYU",
    "ピョ": "combination characters/96_PYO",
    "ミャ": "combination characters/97_MYA",
    "ミュ": "combination characters/98_MYU",
    "ミョ": "combination characters/99_MYO",
    "リャ": "combination characters/100_RYA",
    "リュ": "combination characters/101_RYU",
    "リョ": "combination characters/102_RYO"
]



struct MenuView: View {
    func getColor(index: Int) -> Color {
        let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .pink, .purple]
        return colors[index % colors.count]
    }

    var body: some View {
        NavigationView {
            ZStack {
                Image("Faded_BG")
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
            Image("Faded_BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text(currentCharacter.0)
                    .font(.system(size: 120))
                    .onAppear(perform: getRandomKatakanaCharacter)
                
                Text(currentCharacter.1)
                    .font(.system(size: 50))
                    .foregroundColor(.red)
                
                Button(action: {
                    playAudio()
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
    
    func playAudio() {
        let character = currentCharacter.0
        guard let soundName = allSoundOptions[character] else {
            print("Unable to find sound for character \(character)")
            return
        }
        
        playSound(soundName: soundName)
    }
    
    func playSound(soundName: String) {
        let soundNameComponents = soundName.components(separatedBy: "/")
        guard soundNameComponents.count == 2 else {
            print("Incorrect sound name format: \(soundName)")
            return
        }
        
        let filename = soundNameComponents[1]
        
        guard let url = Bundle.main.url(forResource: filename, withExtension: "mp3") else {
            print("Could not find sound file: \(filename).mp3")
            return
        }
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
        } catch {
            print("Failed to play sound: \(error)")
        }
    }
}
