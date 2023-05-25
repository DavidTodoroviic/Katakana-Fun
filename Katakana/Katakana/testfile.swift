//
//  testfile.swift
//  Katakana
//
//  Created by Ethan Tjan on 23/5/2023.
//

import SwiftUI

struct testfile: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Home View")
                    .font(.largeTitle)

                Button(action: {
                    // Perform any necessary actions here
                }) {
                    Text("Go to Next View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Button Navigation")
            .navigationBarTitleDisplayMode(.inline)

            // Replace "NextView()" with the destination view you want to navigate to
            .background(
                NavigationLink(destination: Game3InfoView()) {
                    EmptyView()
                }
            )
        }
    }
}



struct testfile_Previews: PreviewProvider {
    static var previews: some View {
        testfile()
    }
}
