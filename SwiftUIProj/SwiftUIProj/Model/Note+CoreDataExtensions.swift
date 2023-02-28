//
//  Note+CoreDataExtensions.swift
//  SwiftUIProj
//
//  Created by Nishant Patel on 2/26/23.
//

import Foundation
import CoreData

extension Note {

    var title: String {
        get {
            self.title_ ?? ""
        }
        set {
            self.title_ = newValue
        }
    }

    convenience init(title: String, context: NSManagedObjectContext) {
        self.init(context: context)

        self.title = title

        // Proper strategies for saving covered later
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    public override func awakeFromInsert() {
        self.creationDate = Date()
    }

    static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<Note> {
        let request = NSFetchRequest<Note>(entityName: "Note")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Note.creationDate, ascending: true)]
        request.predicate = predicate

        return request
    }

}
