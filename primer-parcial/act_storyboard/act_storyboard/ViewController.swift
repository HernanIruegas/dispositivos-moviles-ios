//
//  ViewController.swift
//  act_storyboard
//
//  Created by Hernán Iruegas Villarreal on 25/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    
    var nombre: String!
    var email: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "info"){
            let vistaInfo = segue.destination as! ViewControllerInformacion
            vistaInfo.image = imgFoto.image
            vistaInfo.ancho = imgFoto.frame.size.width
            vistaInfo.altura = imgFoto.frame.size.height
        }else{
            let vistaEditar = segue.destination as! ViewControllerEditar
            vistaEditar.nombre = tfNombre.text!
            vistaEditar.email = tfEmail.text!
        }
        
    }
    
    @IBAction func unwindInformacion(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
    }
    
    @IBAction func unwindEditar(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        tfNombre.text = nombre
        tfEmail.text = email
    }

}

