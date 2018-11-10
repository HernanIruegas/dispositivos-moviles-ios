//
//  ViewControllerEditar.swift
//  act_storyboard
//
//  Created by Hernán Iruegas Villarreal on 25/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewControllerEditar: UIViewController {
    
    
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btGuardar: UIButton!
    
    var nombre: String!
    var email: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tfNombre.text = nombre
        tfEmail.text = email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as! UIButton == btGuardar {
            let vistaInic = segue.destination as! ViewController
            vistaInic.nombre = tfNombre.text!
            vistaInic.email = tfEmail.text!
        }
        // si se oprime cancelar no se hace nada
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if sender as! UIButton == btGuardar {
            if( tfNombre.text == "" || tfEmail.text == "" ){
                let alerta = UIAlertController(title: "ERROR", message: "Los datos deben tener datos", preferredStyle: .alert)
                alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alerta, animated: true, completion: nil)
                return false
            }
        }
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
