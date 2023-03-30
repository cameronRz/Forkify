//
//  ForkifyApp.swift
//  Forkify
//
//  Created by Cameron Ramirez on 3/30/23.
//

import SwiftUI

@main
struct ForkifyApp: App {
    @StateObject private var forkifyStore = ForkifyStore()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(forkifyStore)
        }
    }
}
