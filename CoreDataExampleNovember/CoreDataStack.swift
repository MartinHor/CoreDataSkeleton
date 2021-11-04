//
//  CoreDataStack.swift
//  CoreDataExampleNovember
//
//  Created by Martin Hor on 04/11/2021.
//

import Foundation
import CoreData

/// A class defining and managing the core data stack.
class CoreDataStack {

    // MARK: - Internals
    private let coreDataPersistentContainerName = "SampleName"

    // We should always make use of `viewContext` for main queue context
    // and `backgroundContext` for private queue context only.
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: coreDataPersistentContainerName)
        container.loadPersistentStores { _, error in
            guard error == nil else {
                // Crash application if core data stack failed to load.
                fatalError("Failed to load store: \(error!)")
            }
        }

        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
