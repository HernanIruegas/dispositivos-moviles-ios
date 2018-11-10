//
//  Empleado.swift
//  protocoloCodable
//
//  Created by Alumno on 3/8/18.
//  Copyright © 2018 ITESM. All rights reserved.
//

import UIKit

// Al usar codable codificamos las vairables para guardar en disco
// Decodable significa decodificar las variables para mostrarlas en pantalla
class Empleado : Codable {
    
    var nombre : String
    var ident : Int
    var foto : UIImage? // Las fotos no son codificables por default
    
    init(nombre : String, ident : Int, foto : UIImage){
        
        self.nombre = nombre
        self.ident = ident
        self.foto = foto
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first! // Regresa un arreglo de urls
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("empleados")
    
    // Estas son las keys que se van a usar para codificar los datos de la clase Empleado
    enum CodingKeys : String, CodingKey{
        case nombre
        case ident
        case foto
    }
    
    // Como una imagen no es codificable por default, tenemos que hacer la codfiicación manual
    // Cambiando la imagen a un tipo que si se pueda codificar
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nombre, forKey: .nombre)
        try container.encode(ident, forKey: .ident)
        
        var dataDeFoto : Data?
        if let hayFoto = foto { // si hay foto
            dataDeFoto = UIImagePNGRepresentation(hayFoto) // pasarla la foto a datos
        }else{
            dataDeFoto = nil
        }
        
        try container.encode(dataDeFoto, forKey: .foto)
    }
    
    // Sirve para decodificar manualmente los datos 
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        nombre = try container.decode(String.self, forKey: .nombre)
        ident = try container.decode(Int.self, forKey: .ident)
        
        let dataDeFoto = try container.decode(Data?.self, forKey: .foto)
        
        if let hayFoto = dataDeFoto {
            foto = UIImage(data: hayFoto)
        }else{
            foto = nil
        }
    }
    
    
    
    
    
    
    
}
