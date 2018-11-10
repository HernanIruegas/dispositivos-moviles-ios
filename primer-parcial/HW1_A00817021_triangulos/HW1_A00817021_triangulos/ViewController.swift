//
//  ViewController.swift
//  HW1_A00817021_triangulos
//
//  Created by Hernán Iruegas Villarreal on 15/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dimX: UITextField!
    @IBOutlet weak var dimY: UITextField!
    @IBOutlet weak var dimZ: UITextField!
    @IBOutlet weak var tipeTriangle: UISwitch!
    @IBOutlet weak var confirm: UIButton!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var imgTriangle: UIImageView!
    
    var switchOn = true //Estado del switch
    
    // Cambiar de funcionalidad de la aplicación
    @IBAction func changeSwitch(_ sender: Any) {
        
        removeKeyword()
        switchOn = !switchOn
        if(switchOn){
            result.text = " "
            result.isHidden = false
            imgTriangle.isHidden = false
            imgTriangle.image = #imageLiteral(resourceName: "fondo-triangulo")
            confirm.setTitle("Tipo de Triángulo", for: [])
        }else{
            result.text = " "
            result.isHidden = true
            imgTriangle.isHidden = true
            confirm.setTitle("Calcula Area", for: [])
        }
    }
   
    
    // Calcular información del triangulo
    @IBAction func pressBtn(_ sender: Any) {
        
        removeKeyword()
        let a = Double(dimX.text!)
        let b = Double(dimY.text!)
        let c = Double(dimZ.text!)
        
        if( a != nil && b != nil && c != nil ){ //Existen datos en todos los inputs
            
            if(a == 0 || b == 0 || c == 0){//datos incorrectos
                displayAlert(title: "Ocurrió un Error", message: "Un lado no puede ser igual a 0")
            }else if(a! >= b! + c! || b! >= a! + c! || c! >= a! + b!){//datos incorrectos
                displayAlert(title: "Ocurrió un Error", message: "No son medidas validas para un triangulo")
            }else if(switchOn){//datos correctos
                result.text = " "
                result.isHidden = false
                if a == b && b == c {
                    result.text = "Equilátero"
                    imgTriangle.image = #imageLiteral(resourceName: "equilatero")
                } else if a != b && a != c && b != c {
                    result.text = "Escaleno"
                    imgTriangle.image = #imageLiteral(resourceName: "escaleno")
                } else {
                    result.text = "Isósceles"
                    imgTriangle.image = #imageLiteral(resourceName: "isosceles")
                }
            }else { //faltan datos en los inputs
                result.text = " "
                result.isHidden = false
                let s = Double((a! + b! + c!) / 2.0)
                var A = Double((s*(s-a!)*(s-b!)*(s-c!)))
                A = A.squareRoot()
                result.text = "Area = \(A)"
            }
        }else{//Faltan datos en los inputs
            displayAlert(title: "Ocurrió un Error", message: "Favor de ingresar datos en todos los campos")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgTriangle.image = #imageLiteral(resourceName: "fondo-triangulo")
        result.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeKeyword))
        view.addGestureRecognizer(tap)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Función para quitar el teclado de la pantalla
    func removeKeyword() {
        view.endEditing(true)
    }
    
    // Template para general alertas dinámicamente
    func displayAlert(title: String, message: String) {
        
        let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertcontroller, animated: true, completion: nil)
    }
}

