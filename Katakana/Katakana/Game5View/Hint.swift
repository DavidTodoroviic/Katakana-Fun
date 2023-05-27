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
let words = ["icecream", "apartment", "banana","band","bus","bed","bench","bell","beer","bowling","team","cheese","dance","date","department store","dessert","door","drum","elevator","France","football","gum","game","gate","gift","guitar","golf","glass","group","hamburger","heater", "hotel","internet","jeans","card","camera","Canada","cake","case","key","coffee","cola","class","Christmas","melon","meat pie","milk","model","knife","net","noodle","Australia","orange","pants","passport","pasta","pen","pet","piano","pink","pizza","potato","plum","pool","line","register","lemon","restaurant","rocket","rope","rule","surfboard","soccer","salad","sweater","set","sheet","singer","soft","sports","steak","stereo","taxi","tennis","tent","test","toilet","tomato","training","wine"]

let filenames = [
    "aisukuriimu",
    "apaato",
    "banana",
    "bando",
    "basu",
    "beddo",
    "benchi",
    "beru",
    "biiru",
    "booringu",
    "chiimu",
    "chiizu",
    "dansu",
    "deeto",
    "depaato",
    "dezaato",
    "doa",
    "doramu",
    "erebeetaa",
    "furansu",
    "futtobooru",
    "gamu",
    "geemu",
    "geeto",
    "gifuto",
    "gitaa",
    "gorufu",
    "gurasu",
    "guruupu",
    "hanbaagaa",
    "hiitaa",
    "hoteru",
    "intaanetto",
    "jiinzu",
    "kaado",
    "kamera",
    "kanada",
    "keeki",
    "keesu",
    "kii",
    "koohii",
    "koora",
    "kurasu",
    "kurisumasu",
    "meron",
    "miitopai",
    "miruku",
    "moderu",
    "naifu",
    "netto",
    "nuudoru",
    "oosutoraria",
    "orenji",
    "pantsu",
    "pasupooto",
    "pasuta",
    "pen",
    "petto",
    "piano",
    "pinku",
    "piza",
    "poteto",
    "puramu",
    "puuru",
    "rain",
    "reji",
    "remon",
    "resutoran",
    "roketto",
    "roopu",
    "ruuru",
    "saafuboodo",
    "sakkaa",
    "sarada",
    "seetaa",
    "setto",
    "shiito",
    "shingaa",
    "sofuto",
    "supootsu",
    "suteeki",
    "sutereo",
    "takushii",
    "tenisu",
    "tento",
    "tesuto",
    "toire",
    "tomato",
    "toreeningu",
    "wain"
]

//Hint function
struct GlobalFunctions {
    static func getHint() {
        //vibration feedback
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        //all possible hint sounds
        for i in 0..<words.count {
            let word = words[i]
            let filename = filenames[i]

            if randomWord == word {
                guard let soundURL = Bundle.main.url(forResource: filename, withExtension: "mp3") else {
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
}
