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
                Text("Katakana Fun") // Title
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 20) {
                    Image("Japres LOGO_TM Background Removed") // Third logo image name
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                    
                    HStack(spacing: 20) {
                        Image("") // First logo image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                        
                        Image("") // Second logo image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.showContent = true
                    }
                }) {
                    Text("Start Game") // Start game button
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
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
