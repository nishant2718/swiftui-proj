//
//  SwiftUIProjApp.swift
//  SwiftUIProj
//
//  Created by Nishant Patel on 2/11/23.
//

import SwiftUI

@main
struct SwiftUIProjApp: App {
    @Environment(\.scenePhase) var scenePhase 
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { newValue in
            switch scenePhase {
            case .background:
                persistenceController.save()

            default: break
            }
        }

        .commands {
            CommandGroup(replacing: .saveItem) {
                Button("save") {
                    persistenceController.save()
                }.keyboardShortcut("S", modifiers: [.command])
            }
        }

    }
}
