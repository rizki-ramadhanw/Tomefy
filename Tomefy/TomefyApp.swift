//
//  TomefyApp.swift
//  Tomefy
//
//  Created by Rizki Ramadhan Wira Saputra on 18/09/25.
//

import SwiftUI
import CoreData

@main
struct TomefyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
