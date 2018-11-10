//
//  ViewControllerPrisma.swift
//  cuerposGeometricos
//
//  Created by Hernán Iruegas Villarreal on 29/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewControllerPrisma: UIViewController {
    
    
    @IBOutlet weak var tfLargo: UITextField!
    @IBOutlet weak var tfAncho: UITextField!
    @IBOutlet weak var tfAlto: UITextField!
    @IBOutlet weak var imgPrisma: UIImageView!
    @IBOutlet weak var btCancelar: UIButton!
    @IBOutlet weak var btGuardar: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Sirve para regresar a la pantalla de inicio y pasar información de está pantalla hacia la pantalla de inicio
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender as! UIButton == btGuardar{
            
            let largo = Double(tfLargo.text!)!
            let ancho = Double(tfAncho.text!)!
            let alto = Double(tfAlto.text!)!
            let volumen = largo * ancho * alto
            
            let vistaInicio = segue.destination as! ViewController
            vistaInicio.datos1 = "Largo = " + tfLargo.text!
            vistaInicio.datos2 = "Ancho = " + tfAncho.text!
            vistaInicio.datos3 = "Alto = " + tfAlto.text!
            vistaInicio.datos4 = String(volumen)
            vistaInicio.fotoActualizada = imgPrisma.image!
        }else{
            let vistaInicio = segue.destination as! ViewController
            if vistaInicio.fotoActualizada == nil{
                vistaInicio.fotoActualizada = #imageLiteral(resourceName: "CuerposGeometricos")
            }
        }
    }
    
    // Sirve para verificar que el cmapo de Radio tenga datos cuando se oprime el botón de guardar
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if sender as! UIButton == btGuardar{
            if tfAlto.text! == "" || tfLargo.text! == "" || tfAncho.text! == ""  {
                let alerta = UIAlertController(title: "Error", message: "Todos los campos deben tener datos", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alerta, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
    func quitaTeclado() {
        view.endEditing(true)
    }

}
