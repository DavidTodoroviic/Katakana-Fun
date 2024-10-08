import SwiftUI

struct Game4LoseView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var restartTimer: (() -> Void)?
    @Binding var remainingTime: Int
    @Binding var score: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Game 4 lose")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: -120)
                
                VStack {
                    Spacer().frame(height: geometry.size.height * 0.92)
                    
                    HStack(spacing: 25) {
                        Button(action: {
                            self.restartTimer?()
                            self.score = 0 // Reset the score
                            self.remainingTime = 150 // Reset the remaining time
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Play Again")
                                .font(.title2)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 48)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(50)
                        }
                        
                        Button(action: {
                            self.restartTimer?()
                            self.score = 0 // Reset the score
                            self.remainingTime = 150 // Reset the remaining time
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Back")
                                .font(.title2)
                                .padding(.vertical, 20)
                                .padding(.horizontal, 50)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(50)
                        }
                    }
                    .padding(.bottom, 20)
                }
                .offset(x: -80)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: EmptyView())
    }
}

