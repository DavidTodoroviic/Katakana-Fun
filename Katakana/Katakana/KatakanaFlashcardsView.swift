import SwiftUI
import AVFoundation

struct Flashcard {
    let frontImageName: String
    let backImageName: String
}

let flashcards: [Flashcard] = [
    Flashcard(frontImageName: "a-o cards/1_a katakana_1Front", backImageName: "a-o cards/1_a katakana_Back"),
    Flashcard(frontImageName: "a-o cards/2_i katakana_1Front", backImageName: "a-o cards/2_i katakana_Back"),
    Flashcard(frontImageName: "a-o cards/3_u katakana_1Front", backImageName: "a-o cards/3_u katakana_Back"),
    Flashcard(frontImageName: "a-o cards/4_e katakana_1Front", backImageName: "a-o cards/4_e katakana_Back"),
    Flashcard(frontImageName: "a-o cards/5_o katakana_1Front", backImageName: "a-o cards/5_o katakana_Back"),
    Flashcard(frontImageName: "ka-ko cards/6_ka katakana_1Front", backImageName: "ka-ko cards/6_ka katakana_Back"),
    Flashcard(frontImageName: "ka-ko cards/7_ki katakana_1Front", backImageName: "ka-ko cards/7_ki katakana_Back"),
    Flashcard(frontImageName: "ka-ko cards/8_ku katakana_1Front", backImageName: "ka-ko cards/8_ku katakana_Back"),
    // Add more flashcards here
]

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
    "サ": "sa-so/11_SA",
    "シ": "sa-so/12_SHI",
    "ス": "sa-so/13_SU",
    "セ": "sa-so/14_SE",
    "ソ": "sa-so/15_SO",
    "タ": "sa-so/16_TA",
    "チ": "sa-so/17_CHI",
    "ツ": "sa-so/18_TSU",
    "テ": "sa-so/19_TE",
    "ト": "sa-so/20_TO",
    "ナ": "na-no/21_NA",
    "ニ": "na-no/22_NI",
    "ヌ": "na-no/23_NU",
    "ネ": "na-no/24_NE",
    "ノ": "na-no/25_NO",
    "ハ": "na-no/26_HA",
    "ヒ": "na-no/27_HI",
    "フ": "na-no/28_FU",
    "ヘ": "na-no/29_HE",
    "ホ": "na-no/30_HO",
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
    @State private var selectedGroups = Set<UUID>()

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
                        Button(action: {
                            let id = characterGroups[index].id
                            if selectedGroups.contains(id) {
                                selectedGroups.remove(id)
                            } else {
                                selectedGroups.insert(id)
                            }
                        }) {
                            HStack {
                                if selectedGroups.contains(characterGroups[index].id) {
                                    Image(systemName: "checkmark")
                                }
                                Text(characterGroups[index].title)
                            }
                            .padding()
                            .frame(width: 180)
                            .background(getColor(index: index)) // Different color for each button
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .padding([.leading, .trailing], 20)
                    }

                    NavigationLink(destination: KatakanaFlashcardsView(groups: characterGroups.filter { selectedGroups.contains($0.id) })) {
                        Text("Start")
                            .padding()
                            .frame(width: 180)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding([.leading, .trailing], 20)
                    .disabled(selectedGroups.isEmpty)
                    .opacity(selectedGroups.isEmpty ? 0.5 : 1.0)

                    Spacer()
                }
                .navigationTitle("Katakana Groups")
            }
        }
    }
}

struct KatakanaFlashcardsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var currentCharacter = ("", "")
    @State private var soundPlayer: AVAudioPlayer?
    @State private var isShowingBack = false
    @State private var drawing: Path = Path()
    @State private var strokeOrderImage: String = ""

    let groups: [CharacterGroup]

    var body: some View {
        ZStack {
            Image("Faded_BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                if !isShowingBack {
                    FlashcardFrontView(imageName: currentCharacter.0)
                        .onAppear(perform: getRandomKatakanaCharacter)
                        .transition(.scale)
                } else {
                    FlashcardBackView(imageName: currentCharacter.0, character: currentCharacter.0, pronunciation: currentCharacter.1, strokeOrderImage: strokeOrderImage, drawing: $drawing)
                        .transition(.scale)

                }

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

                Button(action: {
                    getRandomKatakanaCharacter()
                    isShowingBack = false
                }) {
                    Text("Next")
                        .padding()
                        .frame(width: 180)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding([.leading, .trailing], 20)

                Button(action: {
                    isShowingBack.toggle()
                }) {
                    Text(isShowingBack ? "Show Front" : "Show Back")
                }
                .padding()
                .frame(width: 180)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing], 20)

                Spacer()
            }
            .navigationTitle("Katakana Flashcards")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            )
        }
    }

    func getRandomKatakanaCharacter() {
        if let group = groups.randomElement(),
           let character = group.characters.randomElement() {
            currentCharacter = character
            soundPlayer = loadAudio(audioName: allSoundOptions[character.0] ?? "")
            strokeOrderImage = "StrokeOrder/\(character.0)"
        }
    }

    func loadAudio(audioName: String) -> AVAudioPlayer? {
        if let soundURL = Bundle.main.url(forResource: audioName, withExtension: "mp3") {
            do {
                let player = try AVAudioPlayer(contentsOf: soundURL)
                return player
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    func playAudio() {
        soundPlayer?.stop()
        soundPlayer?.currentTime = 0.0
        soundPlayer?.play()
    }
}

struct FlashcardFrontView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}


struct FlashcardBackView: View {
    let imageName: String
    let character: String
    let pronunciation: String
    let strokeOrderImage: String
    @Binding var drawing: Path

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()

            Text(character)
                .font(.system(size: 120))
                .foregroundColor(.black)

            Text(pronunciation)
                .font(.title)
                .foregroundColor(.black)

            Image(strokeOrderImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()

            DrawingView(drawing: $drawing)
                .aspectRatio(contentMode: .fit)
                .padding()

            Spacer()

            Button(action: {
                drawing = Path()
            }) {
                Text("Clear Drawing")
                    .font(.title)
            }
            .padding()
        }
    }
}


struct DrawingView: View {
    @Binding var drawing: Path
    @GestureState private var gestureLocation: CGPoint = .zero

    var body: some View {
        let currentDrawing = drawing
        let dragGesture = DragGesture(minimumDistance: 0)
            .updating($gestureLocation) { (value, gestureLocation, _) in
                gestureLocation = value.location
            }
            .onChanged { value in
                let location = value.location
                drawing.addLine(to: location)
            }
            .onEnded { _ in
                drawing = currentDrawing
            }

        Path { path in
            path.move(to: CGPoint.zero)
        }
        .stroke(Color.black, lineWidth: 2)
        .background(Color.white)
        .overlay(
            Path { path in
                path.addPath(drawing)
            }
            .stroke(Color.black, lineWidth: 2)
            .background(Color.clear)
            .gesture(dragGesture)
        )
        .clipped()
    }
}

struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
