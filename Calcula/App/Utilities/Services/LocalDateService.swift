//
//  LocalDateService.swift
//  Calcula
//
//  Created by Vince Santos on 8/20/20.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class LocalDateService {
    func saveLocalDate(date: Date, completion: @escaping(_ didSave: Bool) -> Void) {
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      // 1
      let managedContext =
        appDelegate.persistentContainer.viewContext
      
      // 2
      let entity =
        NSEntityDescription.entity(forEntityName: "LocalDate",
                                   in: managedContext)!
      
      let localDate = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
      
      // 3
      localDate.setValue(date, forKeyPath: "date")
      
      // 4
      do {
        try managedContext.save()
        completion(true)
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
        completion(false)
      }
    }
    
    func loadLocalDate(completion: @escaping(_ hasDate: Date?) -> Void) {
        //1
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
          appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "LocalDate")
        
        //3
        do {
            let localDate = try managedContext.fetch(fetchRequest).first as! LocalDate
            completion(localDate.date!)
        } catch let error as NSError {
            completion(nil)
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
