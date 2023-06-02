//
//  Game2ScreenView.swift
//  Katakana
//
//  Created by Ethan Tjan on 2/6/2023.
//

import Foundation
import SwiftUI
import CoreData


struct Game2ScreenView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            // bg image
            Image("Game 2 Game Screen")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.3)
        }
    }
    
}

struct Game2ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Game2ScreenView()
    }
}
