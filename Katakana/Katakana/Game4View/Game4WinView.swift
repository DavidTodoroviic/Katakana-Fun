import SwiftUI

struct Game4WinView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var restartTimer: (() -> Void)?
    var remainingTime: Int
    @Binding var stopTimer: Bool
    @Binding var hasGameWon: Bool
    @Binding var score: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Game 4 win")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: -60)
                        
                    VStack {
                        Spacer()
        
                    Text("Remaining time: \(remainingTime / 60):\(String(format: "%02d", remainingTime % 60))")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                        .padding(.top, 100)
                        .padding(.bottom, 245)
                    
                    Spacer()
                    
                    HStack(spacing: 24) {
                        Button(action: {
                                self.restartTimer?()
                                self.stopTimer = true
                                self.hasGameWon = false
                                self.score = 0 // Reset the score
                                presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Play Again")
                                .font(.title2)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 46)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(50)
                        }
                        
                        Button(action: {
                                self.restartTimer?()
                                self.stopTimer = true
                                self.hasGameWon = false
                                self.score = 0 // Reset the score
                                presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Back")
                                .font(.title2)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 54)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(50)
                        }
                    }
                    .padding(.top, 170)
                }
                .offset(x: -40)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: EmptyView())
    }
}

