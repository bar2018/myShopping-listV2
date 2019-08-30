//
//  PersistenceService.swift
//  myShopping list2
//
//  Created by Bar Gantovnik on 07/07/2019.
//  Copyright © 2019 Bar Gantovnik. All rights reserved.
//

import Foundation
import CoreData


class PersistenceService {
    // MARK: - Core Data stack
    
    private init() {}
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "myShopping_list2")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("SAVED")
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    static func getShoppingList(arrnged: Bool) -> [Item] {
        var list: [Item] = []
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            list = try PersistenceService.context.fetch(fetchRequest)
        } catch {}
        
        if arrnged {
            return arrangeShopping(list: list)
        } else {
            return list
        }
    }
    
    
    
    
    
    
    
    
    

//    static func getShoppingList(arranged: Bool) ->  [Item]  {
//        var list: [Item] = []
//        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
//        do {
//            list = try PersistenceService.context.fetch(fetchRequest)
//        } catch {
//            print(error)
//        }
//
//        if arranged {
//            return arrangeShopping(list: list)
//        } else {
//            return list
//        }
//    }
//
    private static func arrangeShopping(list: [Item]) -> [Item] {
        return list.sorted { (item0, item1) -> Bool in
            item0.colorID < item1.colorID
        }
    }
}

