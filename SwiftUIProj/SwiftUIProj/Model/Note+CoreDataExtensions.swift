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
