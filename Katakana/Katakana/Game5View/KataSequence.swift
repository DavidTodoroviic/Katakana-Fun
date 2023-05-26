//
//  KataSequence.swift
//  Katakana
//
//  Created by David Todorovic on 24/5/2023.
//

import Foundation
import SwiftUI
import AVFoundation
import UIKit

struct GlobalFunctions1 {
    
    static func getKat() {
        
        if randomWord == "icecream" {
            providedCharacters = ["ア","イ","ス","ク","リ","ー","ム"]
        }
        else if randomWord == "apartment" {
            providedCharacters = ["ア","パ","ー","ト","リ","ム","ス"]
        }
        else if randomWord == "banana" {
            providedCharacters = ["バ","ナ","ナ","ロ","ベ","ト","ラ"]
        }
        else if randomWord == "band" {
            providedCharacters = ["バ","ン","ド","ネ","ナ","ス","ワ"]
        }
        else if randomWord == "bus" {
            providedCharacters = ["バ","ス","セ","オ","ウ","エ","ワ"]
        }
        else if randomWord == "bed" {
            providedCharacters = ["ベ","ッ","ド","ス","ネ","チ","ロ"]
        }
        else if randomWord == "bench" {
            providedCharacters = ["ベ","ン","チ","ト","リ","ケ","セ"]
        }
        else if randomWord == "bell" {
            providedCharacters = ["ベ","ル","セ","リ","チ","ク","コ"]
        }
        else if randomWord == "beer" {
            providedCharacters = ["ビ","ー","ル","ロ","ソ","ウ","エ"]
        }
        else if randomWord == "bowling" {
            providedCharacters = ["ボ","ー","リ","ン","グ","ウ","エ"]
        }
        else if randomWord == "team" {
            providedCharacters = ["チ","ー","ム","タ","ツ","ナ","セ"]
        }
        else if randomWord == "cheese" {
            providedCharacters = ["チ","ー","ズ","ネ","リ","ケ","シ"]
        }
        else if randomWord == "dance" {
            providedCharacters = ["ダ","ン","ス","ベ","オ","ダ","ニ"]
        }
        else if randomWord == "date" {
            providedCharacters = ["デ","ー","ト","ウ","マ","ラ","ロ"]
        }
        else if randomWord == "department store" {
            providedCharacters = ["デ","パ","ー","ト","ロ","エ","フ"]
        }
        else if randomWord == "dessert" {
            providedCharacters = ["デ","ザ","ー","ト","コ","ク","メ"]
        }
        else if randomWord == "door" {
            providedCharacters = ["ド","ア","オ","テ","ク","リ","イ"]
        }
        else if randomWord == "drum" {
            providedCharacters = ["ド","ラ","ム","イ","ク","シ","テ"]
        }
        else if randomWord == "elevator" {
            providedCharacters = ["エ","レ","ベ","ー","タ","ー","マ"]
        }
        else if randomWord == "France" {
            providedCharacters = ["フ","ラ","ン","ス","フ","メ","シ"]
        }
        else if randomWord == "football" {
            providedCharacters = ["フ","ッ","ト","ボ","ー","ル","ベ"]
        }
        else if randomWord == "gum" {
            providedCharacters = ["ガ","ム","ベ","ハ","マ","キ","ナ"]
        }
        else if randomWord == "game" {
            providedCharacters = ["ゲ","ー","ム","ポ","ロ","ウ","エ"]
        }
        else if randomWord == "gate" {
            providedCharacters = ["ゲ","ー","ト","ベ","ソ","オ","ヒ"]
        }
        if randomWord == "gift" {
            providedCharacters = ["ギ","フ","ト","エ","リ","チ","タ"]
        }
        else if randomWord == "guitar" {
            providedCharacters = ["ギ","タ","ー","ロ","コ","ス","マ"]
        }
        else if randomWord == "golf" {
            providedCharacters = ["ゴ","ル","フ","イ","ナ","タ","ヒ"]
        }
        else if randomWord == "glass" {
            providedCharacters = ["グ","ラ","ス","ト","メ","マ","メ"]
        }
        else if randomWord == "group" {
            providedCharacters = ["グ","ル","ー","プ","ク","コ","ヒ"]
        }
        else if randomWord == "hamburger" {
            providedCharacters = ["ハ","ン","バ","ー","ガ","ー","シ"]
        }
        else if randomWord == "heater" {
            providedCharacters = ["ヒ","ー","タ","ー","キ","ポ","コ"]
        }
        else if randomWord == "hotel" {
            providedCharacters = ["ホ","テ","ル","ヒ","メ","ク","メ"]
        }
        else if randomWord == "internet" {
            providedCharacters = ["イ","ン","タ","ー","ネ","ッ","ト"]
        }
        else if randomWord == "jeans" {
            providedCharacters = ["ジ","ー","ン","ズ","タ","ハ","リ"]
        }
        else if randomWord == "card" {
            providedCharacters = ["カ","ー","ド","ナ","テ","チ","リ"]
        }
        else if randomWord == "camera" {
            providedCharacters = ["カ","メ","ラ","ト","リ","オ","キ"]
        }
        else if randomWord == "Canada" {
            providedCharacters = ["カ","ナ","ダ","メ","ウ","ミ","コ"]
        }
        else if randomWord == "cake" {
            providedCharacters = ["ケ","ー","キ","シ","カ","チ","ソ"]
        }
        else if randomWord == "case" {
            providedCharacters = ["ケ","ー","ス","フ","ハ","エ","シ"]
        }
        else if randomWord == "key" {
            providedCharacters = ["キ","ー","ヒ","リ","ハ","ジ","オ"]
        }
        else if randomWord == "coffee" {
            providedCharacters = ["コ","ー","ヒ","ー","ト","ミ","ジ"]
        }
        else if randomWord == "cola" {
            providedCharacters = ["コ","ー","ラ","リ","ポ","ア","ス"]
        }
        else if randomWord == "class" {
            providedCharacters = ["ク","ラ","ス","ソ","キ","バ","ハ"]
        }
        else if randomWord == "Christmas" {
            providedCharacters = ["ク","リ","ス","マ","ス","バ","ナ"]
        }
        else if randomWord == "melon" {
            providedCharacters = ["メ","ロ","ン","ド","ジ","マ","ケ"]
        }
        else if randomWord == "meat pie" {
            providedCharacters = ["ミ","ー","ト","パ","イ","ン","ハ"]
        }
        else if randomWord == "milk" {
            providedCharacters = ["ミ","ル","ク","メ","ネ","ソ","タ"]
        }
        else if randomWord == "model" {
            providedCharacters = ["モ","デ","ル","イ","チ","バ","メ"]
        }
        if randomWord == "knife" {
            providedCharacters = ["ナ","イ","フ","ネ","ロ","ス","オ"]
        }
        else if randomWord == "net" {
            providedCharacters = ["ネ","ッ","ト","ラ","ジ","ソ","テ"]
        }
        else if randomWord == "noodle" {
            providedCharacters = ["ヌ","ー","ド","ル","セ","ハ","ナ"]
        }
        else if randomWord == "Australia" {
            providedCharacters = ["オ","ー","ス","ト","ラ","リ","ア"]
        }
        else if randomWord == "orange" {
            providedCharacters = ["オ","レ","ン","ジ","フ","ラ","ウ"]
        }
        else if randomWord == "pants" {
            providedCharacters = ["パ","ン","ツ","ペ","ケ","チ","ソ"]
        }
        else if randomWord == "passport" {
            providedCharacters = ["パ","ス","ポ","ー","ト","ソ","リ"]
        }
        else if randomWord == "pasta" {
            providedCharacters = ["パ","ス","タ","ナ","ラ","ダ","ポ"]
        }
        else if randomWord == "pen" {
            providedCharacters = ["ペ","ン","ケ","ナ","ソ","チ","テ"]
        }
        else if randomWord == "pet" {
            providedCharacters = ["ペ","ッ","ト","ス","ベ","マ","ケ"]
        }
        else if randomWord == "piano" {
            providedCharacters = ["ピ","ア","ノ","フ","ン","ジ","ダ"]
        }
        else if randomWord == "pink" {
            providedCharacters = ["ピ","ン","ク","カ","フ","ナ","セ"]
        }
        else if randomWord == "pizza" {
            providedCharacters = ["ピ","ザ","パ","ダ","ヒ","タ","ア"]
        }
        else if randomWord == "potato" {
            providedCharacters = ["ポ","テ","ト","ベ","ペ","ワ","シ"]
        }
        else if randomWord == "plum" {
            providedCharacters = ["プ","ラ","ム","チ","フ","ロ","ナ"]
        }
        else if randomWord == "pool" {
            providedCharacters = ["プ","ー","ル","シ","フ","オ","セ"]
        }
        else if randomWord == "line" {
            providedCharacters = ["ラ","イ","ン","ペ","レ","ソ","ジ"]
        }
        else if randomWord == "register" {
            providedCharacters = ["レ","ジ","フ","チ","ナ","ン","エ"]
        }
        else if randomWord == "lemon" {
            providedCharacters = ["レ","モ","ン","イ","ソ","フ","ソ"]
        }
        else if randomWord == "restaurant" {
            providedCharacters = ["レ","ス","ト","ラ","ン","ウ","ペ"]
        }
        else if randomWord == "rocket" {
            providedCharacters = ["ロ","ケ","ッ","ト","ワ","マ","キ"]
        }
        else if randomWord == "rope" {
            providedCharacters = ["ロ","ー","プ","マ","シ","リ","ト"]
        }
        else if randomWord == "rule" {
            providedCharacters = ["ル","ー","ル","ロ","ダ","ジ","セ"]
        }
        else if randomWord == "surfboard" {
            providedCharacters = ["サ","ー","フ","ボ","ー","ド","プ"]
        }
        else if randomWord == "soccer" {
            providedCharacters = ["サ","ッ","カ","ー","フ","ス","ア"]
        }
        else if randomWord == "salad" {
            providedCharacters = ["サ","ラ","ダ","ド","イ","キ","ヒ"]
        }
        else if randomWord == "sweater" {
            providedCharacters = ["セ","ー","タ","ー","ナ","ド","テ"]
        }
        else if randomWord == "set" {
            providedCharacters = ["セ","ッ","ト","ン","ラ","ジ","ネ"]
        }
        else if randomWord == "sheet" {
            providedCharacters = ["シ","ー","ト","ロ","ネ","テ","オ"]
        }
        else if randomWord == "singer" {
            providedCharacters = ["シ","ン","ガ","ー","ベ","ネ","ケ"]
        }
        else if randomWord == "soft" {
            providedCharacters = ["ソ","フ","ト","ポ","テ","キ","ヒ"]
        }
        else if randomWord == "sports" {
            providedCharacters = ["ス","ポ","ー","ツ","フ","エ","タ"]
        }
        else if randomWord == "steak" {
            providedCharacters = ["ス","テ","ー","キ","ト","チ","マ"]
        }
        else if randomWord == "stereo" {
            providedCharacters = ["ス","テ","レ","オ","キ","ハ","ウ"]
        }
        else if randomWord == "taxi" {
            providedCharacters = ["タ","ク","シ","ー","ト","オ","ラ"]
        }
        else if randomWord == "tennis" {
            providedCharacters = ["テ","ニ","ス","フ","イ","オ","ヒ"]
        }
        else if randomWord == "tent" {
            providedCharacters = ["テ","ン","ト","ア","ワ","ケ","ネ"]
        }
        else if randomWord == "test" {
            providedCharacters = ["テ","ス","ト","キ","ソ","ク","ナ"]
        }
        else if randomWord == "toilet" {
            providedCharacters = ["ト","イ","レ","ネ","ハ","ク","ソ"]
        }
        else if randomWord == "tomato" {
            providedCharacters = ["ト","マ","ト","ベ","イ","ロ","ラ"]
        }
        else if randomWord == "training" {
            providedCharacters = ["ト","レ","ー","ニ","ン","グ","ア"]
        }
        else if randomWord == "wine" {
            providedCharacters = ["ワ","イ","ン","ト","タ","ア","フ"]
        }

    }
}

