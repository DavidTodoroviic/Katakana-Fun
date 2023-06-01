import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let gameViews: [(String, AnyView)] = [
        ("", AnyView(Game1MainView())), // Game 1 view
        ("", AnyView(Game2View())), // Game 2 view
        ("", AnyView(Game3InfoView())), // Game 3 view
        ("", AnyView(Game4MainView())), // Game 4 view
        ("", AnyView(Game5MainView())), // Game 5 view
    ]
    
    // Define the images you want to use for the buttons
    let buttonImages: [String] = ["Game 1 Button", "Game 2 Button", "Game 3 Button", "Game 4 Button", "Game 5 Button"]
    
    var body: some View {
        
            NavigationView {
                ZStack {
                    // Add the background image
                    Image("Faded BG")
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(1.1)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: MenuView()) {
                            Image("Flashcards Button")
                                .resizable()
                                .frame(width: 180, height: 40)
                                .cornerRadius(10)
                        }
                        
                        ForEach(gameViews.indices, id: \.self) { index in
                            NavigationLink(destination: gameViews[index].1.environment(\.managedObjectContext, viewContext)) {
                                Image(buttonImages[index % buttonImages.count])
                                    .resizable()
                                    .frame(width: 180, height: 40)
                                    .cornerRadius(10)
                            }
                        }
                        
                        NavigationLink(destination: InfoView().environment(\.managedObjectContext, viewContext)) {
                            Image("Info Button")
                                .resizable()
                                .frame(width: 100, height: 40)
                                .cornerRadius(10)
                        }
                    }
                }
                .navigationBarTitle("Katakana Fun", displayMode: .large) // Set the navigation bar title
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
    }

