//
//  Empleado.swift
//  masterViewController
//
//  Created by Hernán Iruegas Villarreal on 05/03/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class Empleado: NSObject {
    
    var nombre : String!
    var sueldo : Float!
    var foto : UIImage!
    var departamento: String!
    
    init(nombre: String, sueldo: Float, foto: UIImage, departamento: String){
        self.nombre = nombre
        self.sueldo = sueldo
        self.foto = foto
        self.departamento = departamento
    }

}
