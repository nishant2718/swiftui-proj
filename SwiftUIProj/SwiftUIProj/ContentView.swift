//
//  ContentView.swift
//  SwiftUIProj
//
//  Created by Nishant Patel on 2/11/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(fetchRequest: Note.fetch(.all)) private var notes: FetchedResults<Note>

    var body: some View {
        // NavigationView is soft-deprecated.
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        NoteDetailView(note: note)
                    } label: {
                        Text(note.creationDate!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteNotes)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: addNote) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addNote() {
        let newNote = Note(title: "new note", context: viewContext)
    }

    private func deleteNotes(offsets: IndexSet) {
        offsets.map { notes[$0] }.forEach(viewContext.delete)

        //            do {
        //                try viewContext.save()
        //            } catch {
        //                // Replace this implementation with code to handle the error appropriately.
        //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        //                let nsError = error as NSError
        //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        //            }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
