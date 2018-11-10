//
//  ViewControllerEsfera.swift
//  cuerposGeometricos
//
//  Created by Hernán Iruegas Villarreal on 29/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewControllerEsfera: UIViewController {
    
    
    @IBOutlet weak var btCancelar: UIButton!
    @IBOutlet weak var btGuardar: UIButton!
    @IBOutlet weak var tfRadio: UITextField!
    @IBOutlet weak var imgEsfera: UIImageView!
    

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
            
            let radio = Double(tfRadio.text!)!
            let volumen = (4/3) * 3.1416 * pow(radio,3)
            let vistaInicio = segue.destination as! ViewController
            vistaInicio.datos1 = "Radio = " + tfRadio.text!
            vistaInicio.datos4 = String(volumen)
            vistaInicio.fotoActualizada = imgEsfera.image!
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
            if tfRadio.text! == "" {
                let alerta = UIAlertController(title: "Error", message: "Ingresa datos en el campo de Radio", preferredStyle: .alert)
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
