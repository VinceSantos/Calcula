//
//  LocalDate+CoreDataProperties.swift
//  Calcula
//
//  Created by Vince Santos on 8/20/20.
//  Copyright © 2020 Vince Santos. All rights reserved.
//
//

import Foundation
import CoreData


extension LocalDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocalDate> {
        return NSFetchRequest<LocalDate>(entityName: "LocalDate")
    }

    @NSManaged public var date: Date?

}
