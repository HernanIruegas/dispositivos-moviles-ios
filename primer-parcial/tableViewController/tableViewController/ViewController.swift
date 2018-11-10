//
//  ViewController.swift
//  tableViewController
//
//  Created by Hernán Iruegas Villarreal on 12/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tlNombre: UILabel!
    @IBOutlet weak var tlPuntos: UILabel!
    @IBOutlet weak var tlEmail: UILabel!
    
    var nombre : String = ""
    var puntos : Int = 0
    var email : String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tlNombre.text = nombre
        tlPuntos.text = String(puntos)
        tlEmail.text = email
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

