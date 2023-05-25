//
//  Game3InfoView.swift
//  Katakana
//
//  Created by Ethan Tjan on 23/5/2023.
//

import SwiftUI
import CoreData

//struct Game3ButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .font(.title)
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.green)
//            .cornerRadius(10)
//            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
//    }
//}

var char_selection = "."

struct Game3InfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let rows: Int = 3
    let cols: Int = 2
    var chars_selection = ["a - o", "ka - ko", "sa - to", "na - ho", "ma - n", "tenten & maru", "Combination Characters"]
    //@State private var char_selection = "."
    
    var body: some View {
        ZStack {
            // background image
            Image("Katakana cards stars BG")
                .resizable()
                .scaleEffect(1.2)
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 8){
                RoundedRectangle(cornerRadius: 30)
                    .fill(.white)
                    .frame(width: 320, height: 110)
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
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(.white)
                    .frame(width: 320, height: 400)
                    .overlay(
                        VStack(spacing: 0) {
                            ForEach(0..<rows) { row in
                                HStack(spacing: 0) {
                                    ForEach(0..<cols) { column in
                                        Button(action: {
                                            let label = chars_selection[(row * cols + column)]
                                            char_selection = label
                                                
                                        }) {
                                            Text(chars_selection[(row * cols + column)])
                                                .font(.system(size: 30, weight: .bold))
                                                .foregroundColor(.black)
                                                .frame(width: 160, height: 400/3)
                                                .cornerRadius(0)
                                        }
                                    }
                                }
                            }
                        }
                    )
                Spacer()
                    .frame(height: 5)
                Capsule()
                    .fill(.white)
                    .frame(width: 320, height: 70)
                    .overlay(
                        
                            Button(action: {
                                let label = chars_selection[(rows * cols)]
                                char_selection = label
                            }) {
                                Text(chars_selection[(rows * cols)])
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundColor(.black)
                                    .frame(width: 320, height: 400/3)
                                    .cornerRadius(0)
                            }
                    )
                
                        
                    //.padding(.bottom, 0)
            }
            
            
            VStack {
                
                //Spacer()
                Text("Balloon Bash!")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.pink)
                    //.position(x: 305, y: 60)
                Spacer()
                    .frame(height: 40)
                Text("Select Characters")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.pink)
                    //.position(x: 305, y: 60)
                
                    .padding(.bottom, 555)
            }
        }
    }
    
}

struct Game3InfoView_Previews: PreviewProvider {
    static var previews: some View {
        Game3InfoView()
    }
}
