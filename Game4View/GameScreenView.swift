import SwiftUI
import AVFoundation

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
    
    @State private var timeRemaining = 20
    @State private var timer: Timer?
    
    @State private var hasGameEnded = false {
        didSet {
            if hasGameEnded {
                restartTimer()
            }
        }
    }
    
    @State private var score = 0 {
        didSet {
            if score >= 5 {
                isGameWon = true
            }
        }
    }
    
    @State private var isGameWon = false {
        didSet {
            if isGameWon {
                stopTimer()
            }
        }
    }
    
    @State private var isFirstTime = true
    @State private var previousTimeRemaining = 20
    
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
                        Text("")
                            .font(.title)
                            .padding()
                            .fontWeight(.bold)
                            .foregroundColor(.yellow)
                        
                        HStack {
                            Picker(selection: $selectedKatakanaIndex, label: Text("Choose Katakana")) {
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
                            
                            Picker(selection: $selectedRomajiIndex, label: Text("Choose Romaji")) {
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
                            
                            Picker(selection: $selectedSoundIndex, label: Text("Choose Sound")) {
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
                            .onChange(of: selectedSoundIndex) { newValue in
                                let selectedSoundName = soundOptions[newValue]
                                playSound(soundName: selectedSoundName)
                            }
                        }
                        
                        Spacer().frame(height: 400)
                        
                    }
                    .padding()
                    .navigationBarItems(leading:
                        HStack {
                            Text("Score: \(score)")
                                .font(.title)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    )
                    .navigationBarItems(trailing:
                        HStack {
                            Text("Time: \(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    )
                    .navigationBarBackButtonHidden(true)
                    
                    NavigationLink(destination: Game4LoseView(restartTimer: self.restartTimer, remainingTime: self.timeRemaining), isActive: $hasGameEnded) {
                        EmptyView()
                    }
                    .hidden()
                    
                    NavigationLink(destination: Game4WinView(restartTimer: self.restartTimer, remainingTime: self.timeRemaining, stopTimer: self.$isGameWon), isActive: $isGameWon) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
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
            
            if !isGameWon && !hasGameEnded {
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Button(action: {
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
                            Image("InformationButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                        }
                        .padding()
                        .cornerRadius(10)
                        
                        Button(action: {
                            checkForWinning()
                        }) {
                            Image("Unlock button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120)
                        }
                        .padding()
                        .cornerRadius(10)
                    }
                }
            }
        }
    }
    
    func generateNewOptions() {
        let allKatakanaOptions = ["ア", "イ", "ウ", "エ", "オ", "カ", "キ", "ク", "ケ", "コ", "サ", "シ", "ス", "セ", "ソ", "タ", "チ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "ネ", "ノ", "ハ", "ヒ", "フ", "ヘ", "ホ", "マ", "ミ", "ム", "メ", "モ", "ヤ", "ユ", "ヨ", "ラ", "リ", "ル", "レ", "ロ", "ワ", "ン"]
        let allRomajiOptions = ["a", "i", "u", "e", "o", "ka", "ki", "ku", "ke", "ko", "sa", "shi", "su", "se", "so", "ta", "chi", "tsu", "te", "to", "na", "ni", "nu", "ne", "no", "ha", "hi", "fu", "he", "ho", "ma", "mi", "mu", "me", "mo", "ya", "yu", "yo", "ra", "ri", "ru", "re", "ro", "wa", "n"]
        let allSoundOptions = [
            "ア  a-o/1_A", "イ  a-o/2_I", "ウ  a-o/3_U", "エ  a-o/4_E", "オ  a-o/5_O", "カ  ka-ko/6_KA", "キ  ka-ko/7_KI", "ク  ka-ko/8_KU", "ケ  ka-ko/9_KE", "コ  ka-ko/10_KO", "サ  sa-to/11_SA", "シ  sa-to/12_SHI", "ス  sa-to/13_SU", "セ  sa-to/14_SE", "ソ  sa-to/15_SO", "タ  sa-to/16_TA", "チ  sa-to/17_CHI", "ツ  sa-to/18_TSU", "テ  sa-to/19_TE", "ト  sa-to/20_TO", "ナ  na-ho/21_NA", "ニ  na-ho/22_NI", "ヌ  na-ho/23_NU", "ネ  na-ho/24_NE", "ノ  na-ho/25_NO", "ハ  na-ho/26_HA", "ヒ  na-ho/27_HI", "フ  na-ho/28_FU", "ヘ  na-ho/29_HE", "ホ  na-ho/30_HO", "マ  ma-n/31_MA", "ミ  ma-n/32_MI", "ム  ma-n/33_MU", "メ  ma-n/34_ME", "モ  ma-n/35_MO", "ヤ  ma-n/36_YA", "ユ  ma-n/37_YU", "ヨ  ma-n/38_YO", "ラ  ma-n/39_RA", "リ  ma-n/40_RI", "ル  ma-n/41_RU", "レ  ma-n/42_RE", "ロ  ma-n/43_RO", "ワ  ma-n/44_WA", "ン  ma-n/45_N"
        ]

        // Generate new options
        katakana4Options = allKatakanaOptions.shuffled().prefix(5).map { $0 }
        romajiOptions = allRomajiOptions.shuffled().prefix(5).map { $0 }
        soundOptions = allSoundOptions.shuffled().prefix(5).map { $0 }
        
        // Select correct options
        let correctIndex = Int.random(in: 0..<5)
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
        if correctKatakana == katakana4Options[selectedKatakanaIndex]
            && correctRomaji == romajiOptions[selectedRomajiIndex]
            && correctSound == soundOptions[selectedSoundIndex] {
            score += 1
        }
        playSound(soundName: correctSound)
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
    
    func stopTimer() {
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
