//
//  Game3View.swift
//  Katakana
//

//

import SwiftUI
import CoreData
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBAction func someButton(_ sender: UIButton) {
        // when button tapped this code will execute
        imageView.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
    }
}

struct Game3View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var timerValue = 0
    @State private var isGameRunning = false

    // countdown timer
    class TimerCountdown {
        var delegate: Game3View
        var timer: Timer?
        var isPaused: Bool = false
        
        init(delegate: Game3View) {
            self.delegate = delegate
        }
        
        func start() {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
                if !self.isPaused {
                    self.delegate.timerValue -= 1
                    if self.delegate.timerValue == 0{
                        self.end()
                    }
                }
            }
        }
        
        func pause(){
            isPaused = true
        }
        
        func resume(){
            isPaused = false
        }
        
        func end() {
            timer?.invalidate()
            timer = nil
        }
    }

    
    func init_params() -> Void{
        timerValue = 100
        // show user the game info
    }
        
    func play_game() -> Void{
        isGameRunning.toggle()
        TimerCountdown(delegate: self).start()
        if self.timerValue == 0 {
            end_game()
        }
        
        // if user wins, end_game()
    }
    
    func end_game() -> Void{
        // tell user either 'Game Over' or 'Well done'
        // are they supposed to be able to win before time is over ??????????
        // if they can, need to keep track of score
        // if they can't, game only ends when time is up
        TimerCountdown(delegate: self).end()
        
        isGameRunning.toggle()
    }
    
    func check_end() -> Bool{
        var game_finished = false
        
        if timerValue == 0 {
            game_finished = true
        }
        // implement game finished if player finishes before the time is up ???????
        
        return game_finished
    }
    var body: some View {
        ZStack {
            // Add the background image
            Image("Game 3 BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Game 3") // Title of the game
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("Timer: \(timerValue)") // Display the current timer value
                    .font(.title)
                    .foregroundColor(.white)
                
                Button(action: {
                    if !isGameRunning {
                        init_params()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            play_game()
                        }
                    } else {
                        end_game()
                    }
                    
                }) {
                    Text(isGameRunning ? "End Game" : "Start Game") // Button to increment the timer
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20)
                }
                
                Button(action: {
                    withAnimation {
                        self.presentationMode.wrappedValue.dismiss() // Dismiss the current view and go back to the main menu
                    }
                }) {
                    Text("Back to Main Menu") // Button to go back to the main menu
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
        .navigationBarTitle("Game 3", displayMode: .large) // Set the navigation bar title
    }
}

struct Game3View_Previews: PreviewProvider {
    static var previews: some View {
        Game3View()
    }
}

