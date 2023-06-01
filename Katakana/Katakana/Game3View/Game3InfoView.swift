//
//  Game3InfoView.swift
//  Katakana
//
//  Created by Ethan Tjan on 23/5/2023.
//

import SwiftUI
import CoreData

var char_selection = "."

struct Game3InfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let rows: Int = 4
    let cols: Int = 2
    var chars_selection = ["a-o", "ha-ho", "ka-ko", "ma-n", "na-no", "sa-so", "ta-to", "tenten & maru", "Combination Characters"]
    //@State private var char_selection = "."
    
    var body: some View {
        ZStack {
            // background image
            Image("Katakana cards stars BG")
                .resizable()
                .scaleEffect(1.1)
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 5){
                RoundedRectangle(cornerRadius: 30)
                    .fill(.white)
                    .frame(width: 320, height: 80)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(.black, lineWidth: 5))

                Capsule()
                    .fill(.white)
                    .frame(width: 320, height: 50)

                NavigationLink(destination: Game3MainView()) {
                    Image("Next Button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 80)
                }
                .padding(20)
                RoundedRectangle(cornerRadius: 30)
                    .fill(.white)
                    .frame(width: 320, height: 300)
                    .overlay(
                        VStack(spacing: 0) {
                            ForEach(0..<rows) { row in
                                HStack(spacing: 0) {
                                    ForEach(0..<cols) { column in
                                        Button(action: {
                                            let label = chars_selection[(row * cols + column)]
                                            char_selection = label
                                                
                                        }) {
                                            if (row * cols + column != 7)
                                            {
                                                Text(chars_selection[(row * cols + column)])
                                                .font(.custom("Comic Sans MS", size: 30))
                                                .foregroundColor(.black)
                                                .frame(width: 160, height: 300/4)
                                                .cornerRadius(0)
                                            } else {
                                                Text(chars_selection[(row * cols + column)])
                                                .font(.custom("Comic Sans MS", size: 26))
                                                .foregroundColor(.black)
                                                .frame(width: 160, height: 300/4)
                                                .cornerRadius(0)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    )
                Spacer()
                    .frame(height: 2)
                Capsule()
                    .fill(.white)
                    .frame(width: 320, height: 70)
                    .overlay(
                        
                            Button(action: {
                                let label = chars_selection[(rows * cols)]
                                char_selection = label
                            }) {
                                Text(chars_selection[(rows * cols)])
                                    .font(.custom("Comic Sans MS", size: 27))
                                    .foregroundColor(.black)
                                    .frame(width: 320, height: 400/3)
                                    .cornerRadius(0)
                            }
                    )
            }
            
            VStack(spacing: 17) {
                Text("Balloon Bash")
                    .font(.custom("Comic Sans MS", size: 38))
                    .foregroundColor(.pink)
                Text("Select Characters")
                    .font(.custom("Comic Sans MS", size: 35))
                    .foregroundColor(.pink)
                
                    .padding(.bottom, 500)
            }
        }
    }
    
}

struct Game3InfoView_Previews: PreviewProvider {
    static var previews: some View {
        Game3InfoView()
    }
}
