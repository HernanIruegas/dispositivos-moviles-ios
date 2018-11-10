//
//  ViewControllerPopOver.swift
//  popOverActClase
//
//  Created by Hernán Iruegas Villarreal on 12/04/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewControllerPopOver: UIViewController {

    @IBOutlet weak var tfDato: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func listo(_ sender: Any) {
        
        let vista1 = presentingViewController as!ViewController // apuntador a la vista previa
        vista1.dato = tfDato.text!
        vista1.actualizaDato()
    }
}
