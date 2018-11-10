//
//  ViewController.swift
//  SettingsE18
//
//  Created by Yolanda Martinez on 3/25/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbSonido: UILabel!
    @IBOutlet weak var lbExperiencia: UILabel!
    @IBOutlet weak var lbVolumen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cargarSettings()
    }
    
    func cargarSettings(){
        
        let defaults = UserDefaults.standard
        lbNombre.text = defaults.value(forKey: "nombre") as? String
        lbSonido.text = String(describing: defaults.bool(forKey: "sonido"))
        lbVolumen.text = String(describing: defaults.float(forKey: "volumen"))
        lbExperiencia.text = defaults.value(forKey: "experiencia") as? String

    }
    
}

