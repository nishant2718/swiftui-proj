//
//  NotesTest.swift
//  SwiftUIProjTests
//
//  Created by Nishant Patel on 3/29/23.
//

import XCTest
import CoreData
@testable import SwiftUIProj

final class NotesTest: XCTestCase {

    var controller: PersistenceController!
    var context: NSManagedObjectContext {
        controller.container.viewContext
    }

    override func setUpWithError() throws {
        self.controller = PersistenceController.createEmptyStore()
    }

    override func tearDownWithError() throws {
        controller = nil
    }

    func test_notesConvenienceInitializer() {
        let noteTitle = "newtopia"
        let note = Note(title: noteTitle, context: context)

        XCTAssert(note.title == noteTitle)
    }


    func test_notesCreationDate() {
        let note = Note(context: context)
        let noteWithConvenience = Note(title: "RandomBRO", context: context)

        XCTAssertNotNil(note.creationDate)
        XCTAssertNotNil(noteWithConvenience.creationDate)
    }
}
