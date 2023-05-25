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
            providedCharacters = ["ア", "イ", "ス", "ク", "リ", "ーム", "テ"]
            }
            else if randomWord == "apartment" {
                providedCharacters = ["ア", "パ", "ー", "ト", "メ", "ン", "ト"]
            }
            else if randomWord == "banana" {
                providedCharacters = ["バ", "ナ", "ナ"]
            }
            else if randomWord == "band" {
                providedCharacters = ["バ", "ン", "ド"]
            }
            else if randomWord == "bus" {
                providedCharacters = ["バ", "ス"]
            }
            else if randomWord == "bed" {
                providedCharacters = ["ベ", "ッ", "ド"]
            }
            else if randomWord == "bench" {
                providedCharacters = ["ベ", "ン", "チ"]
            }
            else if randomWord == "bell" {
                providedCharacters = ["ベ", "ル"]
            }
            else if randomWord == "beer" {
                providedCharacters = ["ビ", "ー", "ル"]
            }
            else if randomWord == "bowling" {
                providedCharacters = ["ボ", "ウ", "リ", "ン", "グ"]
            }
            else if randomWord == "team" {
                providedCharacters = ["チ", "ー", "ム"]
            }
            else if randomWord == "cheese" {
                providedCharacters = ["チ", "ー", "ズ"]
            }
            else if randomWord == "dance" {
                providedCharacters = ["ダ", "ン", "ス"]
            }
            else if randomWord == "date" {
                providedCharacters = ["デ", "ー", "ト"]
            }
            else if randomWord == "department store" {
                providedCharacters = ["デ", "パ", "ー", "ト", "メ", "ン", "ト", " ", "ス", "ト", "ア"]
            }
            else if randomWord == "dessert" {
                providedCharacters = ["デ", "ザ", "ー", "ト"]
            }
            else if randomWord == "door" {
                providedCharacters = ["ド", "ア"]
            }
            else if randomWord == "drum" {
                providedCharacters = ["ド", "ラ", "ム"]
            }
            else if randomWord == "elevator" {
                providedCharacters = ["エ", "レ", "ベ", "ー", "タ", "ー"]
            }
            else if randomWord == "France" {
                providedCharacters = ["フ", "ラ", "ン", "ス"]
            }
            else if randomWord == "football" {
                providedCharacters = ["フ", "ット", "ボ", "ー", "ル"]
            }
            else if randomWord == "gum" {
                providedCharacters = ["ガ", "ム"]
            }
            else if randomWord == "game" {
                providedCharacters = ["ゲ", "ー", "ム"]
            }
            else if randomWord == "gate" {
                providedCharacters = ["ゲ", "ー", "ト"]
            }
            else if randomWord == "gift" {
                providedCharacters = ["ギ", "フ", "ト"]
            }
            else if randomWord == "guitar" {
                providedCharacters = ["ギ", "タ", "ー"]
            }
            else if randomWord == "golf" {
                providedCharacters = ["ゴ", "ル", "フ"]
            }
            else if randomWord == "glass" {
                providedCharacters = ["グ", "ラ", "ス"]
            }
            else if randomWord == "group" {
                providedCharacters = ["グ", "ル", "ー", "プ"]
            }
            else if randomWord == "hamburger" {
                providedCharacters = ["ハ", "ン", "バ", "ー", "ガ", "ー"]
            }
            else if randomWord == "heater" {
                providedCharacters = ["ヒ", "ー", "タ", "ー"]
            }
            else if randomWord == "hotel" {
                providedCharacters = ["ホ", "テ", "ル"]
            }
            else if randomWord == "internet" {
                providedCharacters = ["イン", "タ", "ー", "ネ", "ット"]
            }
            else if randomWord == "jeans" {
                providedCharacters = ["ジ", "ー", "ン", "ズ"]
            }
            else if randomWord == "card" {
                providedCharacters = ["カ", "ー", "ド"]
            }
            else if randomWord == "camera" {
                providedCharacters = ["カ", "メ", "ラ"]
            }
            else if randomWord == "Canada" {
                providedCharacters = ["カ", "ナ", "ダ"]
            }
            else if randomWord == "cake" {
                providedCharacters = ["ケ", "ー", "キ"]
            }
            else if randomWord == "case" {
                providedCharacters = ["ケ", "ー", "ス"]
            }
            else if randomWord == "key" {
                providedCharacters = ["キ", "ー"]
            }
            else if randomWord == "coffee" {
                providedCharacters = ["コ", "ー", "ヒ", "ー"]
            }
            else if randomWord == "cola" {
                providedCharacters = ["コ", "ー", "ラ"]
            }
            else if randomWord == "class" {
                providedCharacters = ["ク", "ラ", "ス"]
            }
            else if randomWord == "Christmas" {
                providedCharacters = ["ク", "リ", "ス", "マ", "ス"]
            }
            else if randomWord == "melon" {
                providedCharacters = ["メ", "ロ", "ン"]
            }
            else if randomWord == "meat pie" {
                providedCharacters = ["ミ", "ー", "ト", "パ", "イ"]
            }
            else if randomWord == "milk" {
                providedCharacters = ["ミ", "ル", "ク"]
            }
            else if randomWord == "model" {
                providedCharacters = ["モ", "デ", "ル"]
            }
            else if randomWord == "knife" {
                providedCharacters = ["ナ", "イ", "フ"]
            }
            else if randomWord == "net" {
                providedCharacters = ["ネ", "ット"]
            }
            else if randomWord == "noodle" {
                providedCharacters = ["ヌ", "ー", "ド", "ル"]
            }
            else if randomWord == "Australia" {
                providedCharacters = ["オ", "ー", "ス", "ト", "ラ", "リ", "ア"]
            }
            else if randomWord == "orange" {
                providedCharacters = ["オ", "レ", "ン", "ジ"]
            }
            else if randomWord == "pants" {
                providedCharacters = ["パ", "ン", "ツ"]
            }
            else if randomWord == "passport" {
                providedCharacters = ["パ", "ス", "ポ", "ー", "ト"]
            }
            else if randomWord == "pasta" {
                providedCharacters = ["パ", "ス", "タ"]
            }
            else if randomWord == "pen" {
                providedCharacters = ["ペ", "ン"]
            }
            else if randomWord == "pet" {
                providedCharacters = ["ペ", "ッ", "ト"]
            }
            else if randomWord == "piano" {
                providedCharacters = ["ピ", "ア", "ノ"]
            }
            else if randomWord == "pink" {
                providedCharacters = ["ピ", "ン", "ク"]
            }
            else if randomWord == "pizza" {
                providedCharacters = ["ピ", "ッ", "ツ", "ァ"]
            }
            else if randomWord == "potato" {
                providedCharacters = ["ポ", "テ", "ト"]
            }
            else if randomWord == "plum" {
                providedCharacters = ["プ", "ラ", "ム"]
            }
            else if randomWord == "pool" {
                providedCharacters = ["プ", "ー", "ル"]
            }
            else if randomWord == "line" {
                providedCharacters = ["ラ", "イ", "ン"]
            }
            else if randomWord == "register" {
                providedCharacters = ["レ", "ジ", "ス", "タ", "ー"]
            }
            else if randomWord == "lemon" {
                providedCharacters = ["レ", "モ", "ン"]
            }
            else if randomWord == "restaurant" {
                providedCharacters = ["レ", "ス", "ト", "ラン", "ト"]
            }
            else if randomWord == "rocket" {
                providedCharacters = ["ロ", "ケ", "ット"]
            }
            else if randomWord == "rope" {
                providedCharacters = ["ロ", "ー", "プ"]
            }
            else if randomWord == "rule" {
                providedCharacters = ["ル", "ー", "ル"]
            }
            else if randomWord == "surfboard" {
                providedCharacters = ["サ", "ー", "フ", "ボ", "ー", "ド"]
            }
            else if randomWord == "soccer" {
                providedCharacters = ["サ", "ッ", "カ", "ー"]
            }
            else if randomWord == "salad" {
                providedCharacters = ["サ", "ラ", "ダ"]
            }
            else if randomWord == "sweater" {
                providedCharacters = ["ス", "ウ", "ェ", "ッ", "タ", "ー"]
            }
            else if randomWord == "set" {
                providedCharacters = ["セ", "ッ", "ト"]
            }
            else if randomWord == "sheet" {
                providedCharacters = ["シ", "ー", "ト"]
            }
            else if randomWord == "singer" {
                providedCharacters = ["シ", "ン", "ガ", "ー"]
            }
            else if randomWord == "soft" {
                providedCharacters = ["ソ", "フ", "ト"]
            }
            else if randomWord == "sports" {
                providedCharacters = ["ス", "ポ", "ー", "ツ"]
            }
            else if randomWord == "steak" {
                providedCharacters = ["ス", "テ", "ー", "キ"]
            }
            else if randomWord == "stereo" {
                providedCharacters = ["ス", "テ", "レ", "オ"]
            }
            else if randomWord == "taxi" {
                providedCharacters = ["タ", "ク", "シ"]
            }
            else if randomWord == "tennis" {
                providedCharacters = ["テ", "ニ", "ス"]
            }
            else if randomWord == "tent" {
                providedCharacters = ["テ", "ント"]
            }
            else if randomWord == "test" {
                providedCharacters = ["テ", "ス", "ト"]
            }
            else if randomWord == "toilet" {
                providedCharacters = ["ト", "イ", "レ", "ット"]
            }
            else if randomWord == "tomato" {
                providedCharacters = ["ト", "マ", "ト"]
            }
            else if randomWord == "training" {
                providedCharacters = ["ト", "レ", "ー", "ニ", "ン", "グ"]
            }
            else if randomWord == "wine" {
                providedCharacters = ["ワ", "イ", "ン"]
            }
        }
    }

