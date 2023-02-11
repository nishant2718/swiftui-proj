//
//  SwiftUIProjApp.swift
//  SwiftUIProj
//
//  Created by Nishant Patel on 2/11/23.
//

import SwiftUI

@main
struct SwiftUIProjApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
