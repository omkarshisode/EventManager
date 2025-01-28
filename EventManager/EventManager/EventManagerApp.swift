//
//  EventManagerApp.swift
//  EventManager
//
//  Created by Omkar Shisode on 26/01/25.
//

import SwiftUI

@main
struct EventManagerApp: App {
    @StateObject private var persistenController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenController.container.viewContext)
        }
    }
}
