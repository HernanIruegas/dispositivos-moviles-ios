//
//  ViewController.swift
//  EjemploCoreData
//
//  Created by Hernán Iruegas Villarreal on 05/04/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfIdent: UITextField!
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfSueldo: UITextField!
    @IBOutlet weak var lbStatus: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func botonGuardar(_ sender: Any) {
        
        // obtiene el contexto
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if  let id = Int(tfIdent.text!),
            let nom = tfNombre.text,
            let suel = Double(tfSueldo.text!) {
            
            // crea el objeto en el contexto
            let empleado = Empleados(context: managedContext)
            
            empleado.setValue(id, forKey: "ident")
            empleado.setValue(nom, forKey: "nombre")
            empleado.setValue(suel, forKey: "sueldo")
            
            // se llama el mÃ©todo save del managedContext
            do {
                try managedContext.save()
                tfNombre.text = ""
                tfIdent.text = ""
                tfSueldo.text = ""
                lbStatus.text = "Empleado Guardado"
            } catch let error as NSError {
                lbStatus.text = "El empleado no fue guardado"
                print("Error \(error) \(error.userInfo)")
            }
        }
        else {
            lbStatus.text = "No estÃ¡n completos los datos"
            return
        }
        
    }

    @IBAction func botonBuscar(_ sender: Any) {
        
        // obtiene el contexto
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Empleados>(entityName: "Empleado")
        
        // agrega el predicado al request
        let predicado = NSPredicate(format: "(ident = %@)", tfIdent.text!)
        fetchRequest.predicate = predicado
        
        var resultados : [Empleados]!
        
        do {
            resultados = try managedContext.fetch(fetchRequest)
            
            if resultados.count > 0 {
                tfIdent.text = String(resultados[0].ident)
                tfNombre.text = resultados[0].nombre
                tfSueldo.text = String(resultados[0].sueldo)
                lbStatus.text = ""
            }
            else {
                lbStatus.text = "No hay informaciÃ³n del empleado "
            }
        } catch let error as NSError {
            self.lbStatus.text = "Error al leer la base de datos"
            print ("Error al leer \(error) \(error.userInfo)")
        }
    }

    
    
}

