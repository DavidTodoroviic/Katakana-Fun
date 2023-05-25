import SwiftUI
import AVFoundation

struct GameScreenView: View {
    @State private var soundPlayer: AVAudioPlayer?
    
    // Randomly selected correct options
    @State private var correctKatakana = ""
    @State private var correctRomaji = ""
    @State private var correctSound = ""
    
    // Options
    @State private var katakana4Options = [String]()
    @State private var romajiOptions = [String]()
    @State private var soundOptions = [String]()
    
    @State private var selectedKatakanaIndex = 0
    @State private var selectedRomajiIndex = 0
    @State private var selectedSoundIndex = 0
    @State private var chestUnlocked = false
    
    // Timer related variables
    @State private var timeRemaining = 150
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init() {
        generateNewOptions()
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    // Add the background image
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
                                ForEach(0 ..< katakana4Options.count) {
                                    Text(katakana4Options[$0])
                                        .tag($0)
                                        .font(.largeTitle)
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 100, height: 120) // Adjust height here
                            .clipped()
                            .padding(.horizontal)
                            
                            Picker(selection: $selectedRomajiIndex, label: Text("Choose Romaji")) {
                                ForEach(0 ..< romajiOptions.count) {
                                    Text(romajiOptions[$0])
                                        .tag($0)
                                        .font(.largeTitle)
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 100, height: 120) // Adjust height here
                            .clipped()
                            .padding(.horizontal)
                            
                            Picker(selection: $selectedSoundIndex, label: Text("Choose Sound")) {
                                ForEach(0 ..< soundOptions.count) {
                                    Text(soundOptions[$0])
                                        .tag($0)
                                        .font(.largeTitle)
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 100, height: 120) // Adjust height here
                            .clipped()
                            .padding(.horizontal)
                        }
                        
                        Spacer().frame(height: 400)
                        
                    }
                    .padding()
                    .navigationBarItems(trailing:
                        Text("Time: \(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                            .font(.title)
                            .foregroundColor(.white)
                            .onReceive(timer) { _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                }
                            }
                    )
                    .navigationBarBackButtonHidden(true)
                }
            }
            
            // Add the "Question Mark" and "Skip" buttons at the bottom of the screen.
            VStack {
                Spacer()
                HStack(spacing: 30) {
                    Button(action: {
                        generateNewOptions()
                    }) {
                        Image("Next Button")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80) // Adjust button size here
                    }
                    .padding()
                    .cornerRadius(10)
                }
                .padding(.bottom, 20)
            }
        }
    }
    
    // Other functions...
    
    func generateNewOptions() {
        let allKatakanaOptions = ["ア", "イ", "ウ", "エ", "オ", "カ", "キ", "ク", "ケ", "コ"] // Add more options
        let allRomajiOptions = ["A", "I", "U", "E", "O", "KA", "KI", "KU", "KE", "KO"] // Add more options
        let allSoundOptions = ["soundA", "soundI", "soundU", "soundE", "soundO", "soundKA", "soundKI", "soundKU", "soundKE", "soundKO"] // Add more options
        
        katakana4Options = allKatakanaOptions.shuffled().prefix(5).map { $0 }
        romajiOptions = allRomajiOptions.shuffled().prefix(5).map { $0 }
        soundOptions = allSoundOptions.shuffled().prefix(5).map { $0 }
        
        correctKatakana = katakana4Options.randomElement() ?? ""
        correctRomaji = romajiOptions.randomElement() ?? ""
        correctSound = soundOptions.randomElement() ?? ""
        
        selectedKatakanaIndex = 0
        selectedRomajiIndex = 0
        selectedSoundIndex = 0
    }
}
