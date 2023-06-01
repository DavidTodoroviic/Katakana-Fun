import SwiftUI

struct Game4WinView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var restartTimer: (() -> Void)?
    var remainingTime: Int
    @Binding var stopTimer: Bool
    @Binding var hasGameWon: Bool // Add this line
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Game 4 win")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: -70)
                
                VStack {
                    Spacer()
                    
                    Text("Remaining time: \(remainingTime / 60):\(String(format: "%02d", remainingTime % 60))")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                        .padding(.top, 100)
                        .padding(.bottom, 445)
                    
                    Spacer()
                    
                    HStack(spacing: 24) { // Adjust the spacing as needed
                        Button(action: {
                            self.restartTimer?()
                            self.stopTimer = true
                            self.hasGameWon = false // Reset the game win state
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
                }
                .offset(x: -17)
            }
            .frame(width: geometry.size.width, height: geometry.size.height) // Add this line to make the image fit the entire screen
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: EmptyView())
    }
}
