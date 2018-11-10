//
//  jugador.swift
//  tableViewController
//
//  Created by Hernán Iruegas Villarreal on 12/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class jugador: NSObject {
    
    var nombre : String = ""
    var puntos : Int = 0
    var email : String = ""
    
    init(nombre: String, puntos: Int, email: String) {
        self.nombre = nombre
        self.email = email
        self.puntos = puntos
    }

}
