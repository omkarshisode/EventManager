//
//  Persistence.swift
//  EventManager
//
//  Created by Omkar Shisode on 26/01/25.
//

import CoreData

class PersistenceController : ObservableObject {
    static let shared = PersistenceController()
    let container = NSPersistentContainer(name: "EventEntity")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error)")
            }
        }
    }
}
