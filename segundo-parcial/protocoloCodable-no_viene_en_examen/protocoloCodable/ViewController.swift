//
//  ViewController.swift
//  protocoloCodable
//
//  Created by Alumno on 3/8/18.
//  Copyright © 2018 ITESM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var listaEmp = [Empleado]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let emp1 = Empleado(nombre: "David", ident: 123, foto: #imageLiteral(resourceName: "user_male2-512"))
        let emp2 = Empleado(nombre: "Eduardo", ident: 123, foto: #imageLiteral(resourceName: "user_male2-512"))
        
        listaEmp += [emp1, emp2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func guardarEmpleado(_ sender: Any) {
        storeEmployees()
    }
    
    @IBAction func obtenerEmpleado(_ sender: Any) {
        listaEmp.removeAll() // Esto es para probar que en verdad se están obteniendo los datos guardados y nos los datos con los que se inicializo el arreglo
        
        guard let listaEmp = retrieveEmployees() else { return } // listaEmp es una variable local en esta función, no corresponde a la global del archivo
        
        self.listaEmp = listaEmp // Tenemos que igualar la variable local a la variabla listaEmp del archivo entero
        
        for emp in listaEmp {
            print(emp.ident, emp.nombre, emp.foto)
        }
        
    }
    
    func storeEmployees(){
        
        // Lo que hacemos es generar datos codificados (codificar el arreglo listaEmp)
        // Luego guardarlo en el path de ArchiveURL
        do{
            let data = try PropertyListEncoder().encode(listaEmp)
            let success = NSKeyedArchiver.archiveRootObject(data, toFile: Empleado.ArchiveURL.path)
            print(success ? "Saved successfully" : "save failed")
        }catch{
            print("Save Failed")
        }
    }
    
    func retrieveEmployees() -> [Empleado]? {
        
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: Empleado.ArchiveURL.path) as? Data else { return nil }
        
        do{
            let products = try PropertyListDecoder().decode([Empleado].self, from: data)
            return products
        }catch{
            print("Retrieve failed")
            return nil
        }
    }
    
    
    
    
    
    
    
}

