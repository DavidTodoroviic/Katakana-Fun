//
//  Hint.swift
//  Katakana
//
//  Created by David Todorovic on 24/5/2023.
//

import Foundation
import SwiftUI
import AVFoundation
import UIKit

//Hint function
struct GlobalFunctions {
    static func getHint() {
        //vibration feedback
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        //all possible hint sounds
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "apartment" {
            guard let soundURL = Bundle.main.url(forResource: "apaato", withExtension: "mp3") else {
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
        if randomWord == "banana" {
            guard let soundURL = Bundle.main.url(forResource: "banana", withExtension: "mp3") else {
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
        if randomWord == "band" {
            guard let soundURL = Bundle.main.url(forResource: "bando", withExtension: "mp3") else {
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
        if randomWord == "bus" {
            guard let soundURL = Bundle.main.url(forResource: "basu", withExtension: "mp3") else {
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
        if randomWord == "bed" {
            guard let soundURL = Bundle.main.url(forResource: "beddo", withExtension: "mp3") else {
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
        if randomWord == "bench" {
            guard let soundURL = Bundle.main.url(forResource: "benchi", withExtension: "mp3") else {
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
        if randomWord == "bell" {
            guard let soundURL = Bundle.main.url(forResource: "beru", withExtension: "mp3") else {
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
        if randomWord == "beer" {
            guard let soundURL = Bundle.main.url(forResource: "biiru", withExtension: "mp3") else {
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
        if randomWord == "bowling" {
            guard let soundURL = Bundle.main.url(forResource: "booringu", withExtension: "mp3") else {
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
        if randomWord == "team" {
            guard let soundURL = Bundle.main.url(forResource: "chiimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        if randomWord == "icecream" {
            guard let soundURL = Bundle.main.url(forResource: "aisukuriimu", withExtension: "mp3") else {
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
        
    }
}
