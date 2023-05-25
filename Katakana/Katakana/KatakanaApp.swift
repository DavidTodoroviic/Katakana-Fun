//
//  KatakanaApp.swift
//  Katakana
//
//

import SwiftUI

@main
struct KatakanaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView() // The main view of the application
                .environment(\.managedObjectContext, persistenceController.container.viewContext) // Providing the managed object context to the ContentView
        }
    }
}

