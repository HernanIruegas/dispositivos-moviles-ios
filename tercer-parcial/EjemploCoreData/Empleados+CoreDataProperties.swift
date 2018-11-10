//
//  Empleados+CoreDataProperties.swift
//  EjemploCoreData
//
//  Created by Hernán Iruegas Villarreal on 05/04/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import Foundation
import CoreData


extension Empleados {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Empleados> {
        return NSFetchRequest<Empleados>(entityName: "Empleados");
    }

    @NSManaged public var ident: Int32
    @NSManaged public var nombre: String?
    @NSManaged public var sueldo: Float

}
