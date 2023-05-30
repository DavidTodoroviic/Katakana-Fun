//
//  Fonts.swift
//  Katakana
//
//  Created by David Todorovic on 31/5/2023.
//

import Foundation
import SwiftUI

extension Font {
    static func myFonts(_ name: String, size: CGFloat) -> Font {
        return Font.custom(name, size: size)
    }
}
