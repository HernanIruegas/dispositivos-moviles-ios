//
//  Actividad.swift
//  protocolos
//
//  Created by Hernán Iruegas Villarreal on 22/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class Actividad: NSObject {
    
    var nombreAlum : String!
    var calif : Int!
    var coment : String!
    
    init(nombreAlum: String, calif: Int, coment: String) {
        self.nombreAlum = nombreAlum
        self.calif = calif
        self.coment = coment
    }
    
    init(nombreAlum: String) {
        self.nombreAlum = nombreAlum
        self.calif = 0
        self.coment = nil
    }

}
