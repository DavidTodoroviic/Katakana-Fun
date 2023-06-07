import SwiftUI
import CoreData

struct LandingView: View {
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            Image("Katakana cards stars BG") // Background image name
                .resizable()
                .scaledToFill()
                .scaleEffect(1.1)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Image("Logo no white") // Additional image
                    .resizable()
                    .scaledToFit() // Ensures that the image scales correctly
                    .frame(maxWidth: .infinity) // Makes the image take up as much space as it can
                
                Spacer()
                
                HStack {
                    Image("Katakana crane 1") // Crane image 1
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Image("Title Landing") // Title image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                    
                    Image("Katakana crane 2") // Crane image 2
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .scaleEffect(x: -1, y: 1, anchor: .center) // Flip the image horizontally
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.showContent = true
                    }
                }) {
                    Image("Start") // Start game button image
                        .resizable()
                        .scaledToFit() // Ensures that the image scales correctly
                        .frame(maxWidth: 200, maxHeight: 60)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity) // Makes the button take up as much space as it can
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 40)
        }
        .fullScreenCover(isPresented: $showContent) {
            ContentView() // Transition to ContentView when Start Game button is tapped
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
