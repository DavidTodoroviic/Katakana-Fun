//
//  Game5ScreenView.swift
//  Katakana
//
//  Created by David Todorovic on 11/5/2023.
//

import SwiftUI
import AVFoundation
import UIKit

var randomWord = ""
var providedCharacters = ["ア","イ","ス","ク","リ","ー","ム"]
var audioPlayer: AVAudioPlayer?

struct GameScreenView5: View {
    
    @State private var englishWords = ["icecream", "apartment", "banana","band","bus","bed","bench","bell","beer","bowling","team","cheese","dance","date","department store","dessert","door","drum","elevator","France","football","gum","game","gate","gift","guitar","golf","glass","group","hamburger","heater", "hotel","internet","jeans","card","camera","Canada","cake","case","key","coffee","cola","class","Christmas","melon","meat pie","milk","model","knife","net","noodle","Australia","orange","pants","passport","pasta","pen","pet","piano","pink","pizza","potato","plum","pool","line","register","lemon","restaurant","rocket","rope","rule","surfboard","soccer","salad","sweater","set","sheet","singer","soft","sports","steak","stereo","taxi","tennis","tent","test","toilet","tomato","training","wine"]
    
    @State private var wordList = [
    "アイスクリーム",
    "アパート",
    "バナナ",
    "バンド",
    "バス",
    "ベッド",
    "ベンチ",
    "ベル",
    "ビール",
    "ボーリング",
    "チーム",
    "チーズ",
    "ダンス",
    "デート",
    "デパート",
    "デザート",
    "ドア",
    "ドラム",
    "エレベーター",
    "フランス",
    "フットボール",
    "ガム",
    "ゲーム",
    "ゲート",
    "ギフト",
    "ギター",
    "ゴルフ",
    "グラス",
    "グループ",
    "ハンバーガー",
    "ヒーター",
    "ホテル",
    "インターネット",
    "ジーンズ",
    "カード",
    "カメラ",
    "カナダ",
    "ケーキ",
    "ケース",
    "キー",
    "コーヒー",
    "コーラ",
    "クラス",
    "クリスマス",
    "メロン",
    "ミートパイ",
    "ミルク",
    "モデル",
    "ナイフ",
    "ネット",
    "ヌードル",
    "オーストラリア",
    "オレンジ",
    "パンツ",
    "パスポート",
    "パスタ",
    "ペン",
    "ペット",
    "ピアノ",
    "ピンク",
    "ピザ",
    "ポテト",
    "プラム",
    "プール",
    "ライン",
    "レジ",
    "レモン",
    "レストラン",
    "ロケット",
    "ロープ",
    "ルール",
    "サーフボード",
    "サッカー",
    "サラダ",
    "セーター",
    "セット",
    "シート",
    "シンガー",
    "ソフト",
    "スポーツ",
    "ステーキ",
    "ステレオ",
    "タクシー",
    "テニス",
    "テント",
    "テスト",
    "トイレ",
    "トマト",
    "トレーニング",
    "ワイン"
    ]
    
    @State private var currentWord = ""
    @State private var selectedCharacters: [Character] = []
    @State private var score = 0
    @State private var timeRemaining = 120
    @State private var timer: Timer?
    
    var body: some View {
        //Ready page
        if timeRemaining == 120 {
            VStack {
                Image("Start Button")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        //random english word
                        randomWord = englishWords.randomElement() ?? ""
                        //get katakana that matches the word
                        GlobalFunctions1.getKat()
                        //shuffle the katakana
                        providedCharacters.shuffle()
                        //start timer
                        Started()
                           }
                   }
        }
        //Time's up screen
        if timeRemaining == 0 {
                    Image("Game 5 win")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            }
        
            //Game Start screen
            if timeRemaining < 120 && timeRemaining != 0{
                ZStack {
                //background
                Image("Game 5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

                    VStack {
                        HStack{
                            //timer
                            Text(timeString(from: timeRemaining))
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(20)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(40)
                            //score
                            Text("Score: \(score)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(20)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(40)
                
                        }
                        HStack{
                            //english word
                            Text(randomWord)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(20)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(40)
                            //hint
                            Button(action: GlobalFunctions.getHint) {
                                Text("?")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .cornerRadius(8)
                            }
                        }
                        
                        //Katakana Buttons
                        VStack(spacing: 20) {
                            Text(currentWord)
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(20)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(40)
                            
                            VStack(spacing: 22) {
                                HStack(spacing: 22) {
                                    ForEach(0..<2) { index in
                                        characterButton(at: index)
                                    }
                                }
                                HStack(spacing: 22) {
                                    ForEach(2..<5) { index in
                                        characterButton(at: index)
                                    }
                                }
                                HStack(spacing: 22) {
                                    ForEach(5..<7) { index in
                                        characterButton(at: index)
                                    }
                                }
                            }
                            
                            HStack{
                                // Skip button
                                Button(action: skipGame) {
                                    Text("Skip")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color.black)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                //Check button
                                Button(action: checkWord) {
                                    Text("Check")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                // Clear button
                                Button(action: clearGame) {
                                    Text("Clear")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                           
                        }
                    }
                }
            }
            
        }
         
    
        //Score increase
        func increaseScore() {
            if score < 10 {
                score += 1
            } else {
                score += 5
            }
        }
        
        //Start button
        func Started() {
            startTimer()
        }
        //Start timer
        func startTimer() {
            timeRemaining = 120 // Reset the timer to 2 minutes
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    timer.invalidate()
                }
            }
        }
        
        //Time remaining
        func timeString(from seconds: Int) -> String {
            let minutes = seconds / 60
            let seconds = seconds % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
        
        //Katakana Charecters Button function
        func characterButton(at index: Int) -> some View {
            let character = providedCharacters[index]
            return Button(action: {
                currentWord.append(character)
                selectedCharacters.append(character.first!)
                //vibration feedback
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
            }) {
                Text(String(character))
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(20)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(40)
            }
        }
        
        //Delete written word
        func clearGame() {
            //vibration
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            currentWord = ""
            selectedCharacters = []
        }
    
    
    //skip current word
    func skipGame() {
        //vibration
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        //change english word
        randomWord = englishWords.randomElement() ?? ""
        //get katakana that matches the word
        GlobalFunctions1.getKat()
        //shuffle the katakana
        providedCharacters.shuffle()
        currentWord = ""
        selectedCharacters = []
    }
        
        //Check word if correct add score plus reset game
        func checkWord() {
                print(wordList)
                //if correct
               if wordList.contains(currentWord) {
                    showAlert(title: "Congratulations!", message: "You spelled the word correctly!")
                    //add score
                    playCorrectSound()
                    score += 1
                    //change english word
                    randomWord = englishWords.randomElement() ?? ""
                    //get katakana that matches the word
                    GlobalFunctions1.getKat()
                    //shuffle the katakana
                    providedCharacters.shuffle()
                    clearGame()
                    //vibration feedback
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                    return
                }
                //if not
            if !wordList.contains(currentWord) {
                    //vibration feedback
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                    playErrorSound()
                    return
                }
            }
        
    //play error sound
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
        
    //Show Alert
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    
}
