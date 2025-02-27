//
//  CoreDataStack.swift
//  SprintChallengeCalorieTracker
//
//  Created by morse on 12/20/19.
//  Copyright © 2019 morse. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {

    // Let us access the CoreDataStack from anywhere in the app.
    static let shared = CoreDataStack()

    // Set up a persistent container

    lazy var container: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "SprintChallengeCalorieTracker")

        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
    }()

    // Create easy access to the moc (managed object context)
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }

    func save(context: NSManagedObjectContext) throws {
        var error: Error?

        do {
            try context.save()
        } catch let saveError {
            error = saveError
        }

        if let error = error { throw error }
    }
}
