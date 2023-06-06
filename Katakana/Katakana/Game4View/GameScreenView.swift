import SwiftUI
import AVFoundation

struct Katakana {
    let character: String
    let romaji: String
    let sound: String
}

struct GameScreenView: View {
    @State private var soundPlayer: AVAudioPlayer?
    
    @State private var correctKatakana = ""
    @State private var correctRomaji = ""
    @State private var correctSound = ""
    
    @State private var katakana4Options = [String]()
    @State private var romajiOptions = [String]()
    @State private var soundOptions = [String]()
    
    @State private var selectedKatakanaIndex = 0
    @State private var selectedRomajiIndex = 0
    @State private var selectedSoundIndex = 0
    @State private var chestUnlocked = false
    
    @State private var timeRemaining = 150
    @State private var timer: Timer?
    @State private var score = 0
    @State private var stopTimer = false
    @State private var correctIndex = 0
    
    @State private var hasGameEnded = false {
        didSet {
            if hasGameEnded {
                restartTimer()
            }
        }
    }
    
    @State private var hasGameWon = false {
        didSet {
            if hasGameWon {
                stopGameTimer() // Update the method name here
            }
        }
    }
    
    @State private var isFirstTime = true
    @State private var previousTimeRemaining = 150
    
    let allOptions: [Katakana] = [
        Katakana(character: "ア", romaji: "a", sound: "ア  a-o/1_A"),
        Katakana(character: "イ", romaji: "i", sound: "イ  a-o/2_I"),
        Katakana(character: "ウ", romaji: "u", sound: "ウ  a-o/3_U"),
        Katakana(character: "エ", romaji: "e", sound: "エ  a-o/4_E"),
        Katakana(character: "オ", romaji: "o", sound: "オ  a-o/5_O"),
        Katakana(character: "カ", romaji: "ka", sound: "カ  ka-ko/6_KA"),
        Katakana(character: "キ", romaji: "ki", sound: "キ  ka-ko/7_KI"),
        Katakana(character: "ク", romaji: "ku", sound: "ク  ka-ko/8_KU"),
        Katakana(character: "ケ", romaji: "ke", sound: "ケ  ka-ko/9_KE"),
        Katakana(character: "コ", romaji: "ko", sound: "コ  ka-ko/10_KO"),
        Katakana(character: "サ", romaji: "sa", sound: "サ  sa-to/11_SA"),
        Katakana(character: "シ", romaji: "shi", sound: "シ  sa-to/12_SHI"),
        Katakana(character: "ス", romaji: "su", sound: "ス  sa-to/13_SU"),
        Katakana(character: "セ", romaji: "se", sound: "セ  sa-to/14_SE"),
        Katakana(character: "ソ", romaji: "so", sound: "ソ  sa-to/15_SO"),
        Katakana(character: "タ", romaji: "ta", sound: "タ  sa-to/16_TA"),
        Katakana(character: "チ", romaji: "chi", sound: "チ  sa-to/17_CHI"),
        Katakana(character: "ツ", romaji: "tsu", sound: "ツ  sa-to/18_TSU"),
        Katakana(character: "テ", romaji: "te", sound: "テ  sa-to/19_TE"),
        Katakana(character: "ト", romaji: "to", sound: "ト  sa-to/20_TO"),
        Katakana(character: "ナ", romaji: "na", sound: "ナ  na-ho/21_NA"),
        Katakana(character: "ニ", romaji: "ni", sound: "ニ  na-ho/22_NI"),
        Katakana(character: "ヌ", romaji: "nu", sound: "ヌ  na-ho/23_NU"),
        Katakana(character: "ネ", romaji: "ne", sound: "ネ  na-ho/24_NE"),
        Katakana(character: "ノ", romaji: "no", sound: "ノ  na-ho/25_NO"),
        Katakana(character: "ハ", romaji: "ha", sound: "ハ  na-ho/26_HA"),
        Katakana(character: "ヒ", romaji: "hi", sound: "ヒ  na-ho/27_HI"),
        Katakana(character: "フ", romaji: "fu", sound: "フ  na-ho/28_FU"),
        Katakana(character: "ヘ", romaji: "he", sound: "ヘ  na-ho/29_HE"),
        Katakana(character: "ホ", romaji: "ho", sound: "ホ  na-ho/30_HO"),
        Katakana(character: "マ", romaji: "ma", sound: "マ  ma-ro/31_MA"),
        Katakana(character: "ミ", romaji: "mi", sound: "ミ  ma-ro/32_MI"),
        Katakana(character: "ム", romaji: "mu", sound: "ム  ma-ro/33_MU"),
        Katakana(character: "メ", romaji: "me", sound: "メ  ma-ro/34_ME"),
        Katakana(character: "モ", romaji: "mo", sound: "モ  ma-ro/35_MO"),
        Katakana(character: "ヤ", romaji: "ya", sound: "ヤ  ya-n/36_YA"),
        Katakana(character: "ユ", romaji: "yu", sound: "ユ  ya-n/37_YU"),
        Katakana(character: "ヨ", romaji: "yo", sound: "ヨ  ya-n/38_YO"),
        Katakana(character: "ラ", romaji: "ra", sound: "ラ  ra-ro/39_RA"),
        Katakana(character: "リ", romaji: "ri", sound: "リ  ra-ro/40_RI"),
        Katakana(character: "ル", romaji: "ru", sound: "ル  ra-ro/41_RU"),
        Katakana(character: "レ", romaji: "re", sound: "レ  ra-ro/42_RE"),
        Katakana(character: "ロ", romaji: "ro", sound: "ロ  ra-ro/43_RO"),
        Katakana(character: "ワ", romaji: "wa", sound: "ワ  wa-n/44_WA"),
        Katakana(character: "ヲ", romaji: "wo", sound: "ヲ  wa-n/45_WO"),
        Katakana(character: "ン", romaji: "n", sound: "ン  wa-n/46_N")
        // Add other characters if necessary, like "ガ", "ギ", "グ", "ゲ", "ゴ", etc.
    ]
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Image("Game 4 play bg")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 10) {
                        Spacer()
                        HStack {
                            Picker(selection: $selectedKatakanaIndex.animation(), label: Text("Choose Katakana")) {
                                ForEach(0..<katakana4Options.count) { index in
                                    Text(katakana4Options[index])
                                        .tag(index)
                                        .font(.largeTitle)
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 100, height: 120)
                            .clipped()
                            .padding(.horizontal)
                            .onChange(of: selectedKatakanaIndex) { _ in
                                checkForWinning()
                            }

                            Picker(selection: $selectedRomajiIndex.animation(), label: Text("Choose Romaji")) {
                                ForEach(0..<romajiOptions.count) { index in
                                    Text(romajiOptions[index])
                                        .tag(index)
                                        .font(.largeTitle)
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 100, height: 120)
                            .clipped()
                            .padding(.horizontal)
                            .onChange(of: selectedRomajiIndex) { _ in
                                checkForWinning()
                            }

                            Picker(selection: $selectedSoundIndex.animation(), label: Text("Choose Sound")) {
                                ForEach(0..<soundOptions.count) { index in
                                    Text(soundOptions[index])
                                        .tag(index)
                                        .font(.largeTitle)
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 100, height: 120)
                            .clipped()
                            .padding(.horizontal)
                            .onChange(of: selectedSoundIndex) { _ in
                                let selectedSoundName = soundOptions[selectedSoundIndex]
                                playSound(soundName: selectedSoundName)
                                checkForWinning()
                            }
                        }
                        
                        Spacer().frame(height: 350)
                        
                    }
                    .padding()
                    .navigationBarItems(leading:
                        Text("Score: \(score)")
                            .font(.title)
                            .foregroundColor(.white),
                     trailing:
                        Text("Time: \(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                            .font(.title)
                            .foregroundColor(.white)
                    )

                    .navigationBarBackButtonHidden(true)
                    
                    NavigationLink(destination: Game4WinView(restartTimer: self.restartTimer, remainingTime: self.timeRemaining, stopTimer: self.$stopTimer, hasGameWon: self.$hasGameWon, score: self.$score), isActive: $hasGameWon) {
                        EmptyView()
                    }
                    .hidden()


                    NavigationLink(destination: Game4LoseView(restartTimer: self.restartTimer, remainingTime: self.$timeRemaining, score: self.$score), isActive: $hasGameEnded) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear {
                if isFirstTime {
                    generateNewOptions()
                    isFirstTime = false
                    restartTimer() // Start the timer immediately
                } else {
                    timeRemaining = previousTimeRemaining
                    restartTimer() // Start the timer immediately
                }
            }
            
            if !hasGameWon && !hasGameEnded {
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Button(action: {
                            hasGameWon = false
                            previousTimeRemaining = timeRemaining
                            generateNewOptions()
                            restartTimer()
                        }) {
                            Image("Next Button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                        }
                        .padding()
                        .cornerRadius(10)
                        
                        NavigationLink(destination: GameInfoView()) {
                            Image("Info")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                        }
                        .padding()
                        .cornerRadius(10)
                        
                        Button(action: {
                            checkForWinning()
                            if score >= 5 { // Check if score is 5 or greater
                                hasGameWon = true // Set hasGameWon to true
                            }
                        }) {
                            Image("Unlock button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120)
                        }
                        .padding()
                        .cornerRadius(10)
                    }
                    NavigationLink(destination: Game4MainView()) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.top)
                }
            }
        }
    }
    
    func generateNewOptions() {
        let selectedOptions = allOptions.shuffled().prefix(4)

        // Generate new options
        katakana4Options = selectedOptions.map { $0.character }
        romajiOptions = selectedOptions.map { $0.romaji }
        soundOptions = selectedOptions.map { $0.sound }

        // Select correct options
        correctIndex = Int.random(in: 0..<4)
        correctKatakana = katakana4Options[correctIndex]
        correctRomaji = romajiOptions[correctIndex]
        correctSound = soundOptions[correctIndex]

        // Reset selected indices and chestUnlocked
        selectedKatakanaIndex = 0
        selectedRomajiIndex = 0
        selectedSoundIndex = 0
        chestUnlocked = false
    }

    func checkForWinning() {
        let selectedKatakana = katakana4Options[selectedKatakanaIndex]
        let selectedRomaji = romajiOptions[selectedRomajiIndex]
        let selectedSound = soundOptions[selectedSoundIndex]

        if selectedKatakana == correctKatakana && selectedRomaji == correctRomaji && selectedSound == correctSound {
            score += 1
            print("Correct Combination")
            print("Score: \(score)")

            if score >= 5 {
                hasGameWon = true
                stopGameTimer() // Stop the timer when the game is won
                print("Game Won!")
            } else {
                generateNewOptions() // Generate new options when a point is scored
            }
        } else {
            hasGameWon = false
            print("Incorrect Combination")
            print("Selected: \(selectedKatakana), \(selectedRomaji), \(selectedSound)")
            print("Correct: \(correctKatakana), \(correctRomaji), \(correctSound)")
        }
    }


    func restartTimer() {
        timeRemaining = previousTimeRemaining
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                hasGameEnded = true
                timer?.invalidate()
            }
        }
    }
    
    func stopGameTimer() {
        timer?.invalidate()
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
