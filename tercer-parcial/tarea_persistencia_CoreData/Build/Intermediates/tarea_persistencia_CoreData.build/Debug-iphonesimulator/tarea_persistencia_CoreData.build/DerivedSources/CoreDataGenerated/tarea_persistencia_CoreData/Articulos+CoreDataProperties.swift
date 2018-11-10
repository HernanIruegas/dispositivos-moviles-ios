//
//  Articulos+CoreDataProperties.swift
//  
//
//  Created by Hernán Iruegas Villarreal on 16/04/18.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Articulos {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Articulos> {
        return NSFetchRequest<Articulos>(entityName: "Articulos");
    }

    @NSManaged public var descripcion: String?
    @NSManaged public var existencia: Int32
    @NSManaged public var id: String?

}
