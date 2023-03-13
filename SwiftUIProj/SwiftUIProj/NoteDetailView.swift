//
//  NoteDetailView.swift
//  SwiftUIProj
//
//  Created by Nishant Patel on 2/27/23.
//

import Foundation
import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var note: Note

    var body: some View {
        VStack {
            Text("Note Detail View")
                .font(.title)

            HStack {
                Text("Title: ")
                Text(note.title)
            }

            Button("Clear title") {
                note.title = ""
            }

            TextField("title", text: $note.title)
                .textFieldStyle(.roundedBorder)

            Button("Delete Note") {
                let context = note.managedObjectContext
                context?.delete(note)
            }
            .foregroundColor(.brown)
        }
        .padding()
        .onDisappear {
            PersistenceController.shared.save()
        }
    }

}
