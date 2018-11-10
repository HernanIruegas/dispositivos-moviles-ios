//
//  ViewController.swift
//  cuerposGeometricos
//
//  Created by Hernán Iruegas Villarreal on 29/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var lbData1: UILabel!
    @IBOutlet weak var lbData2: UILabel!
    @IBOutlet weak var lbData3: UILabel!
    @IBOutlet weak var lbData4: UILabel!
    
    var fotoActualizada : UIImage!
    var datos1 : String!
    var datos2 : String!
    var datos3 : String!
    var datos4 : String!
    
    
    /* ESTOS UNWIND SIRVEN PARA QUE EL USUARIO PUEDA REGRESARSE A ESTA PANTALLA, DESDE OTRAS PANTALLAS */
    
    /* TAMBIEN SIRVEN PARA QUE EL BOTON DE EXIT DE LA PANTALLA DONDE ESTÁ EL USUARIO PUEDA VER ESTOS MÉTODOS */
    @IBAction func unwindEsfera(unwindSegue : UIStoryboardSegue){
        
        foto.image = fotoActualizada
        lbData1.text = datos1
        lbData2.text = ""
        lbData3.text = ""
        lbData4.text = datos4
        
    }
    
    @IBAction func unwindPrisma(unwindSegue : UIStoryboardSegue){
        
        foto.image = fotoActualizada
        lbData1.text = datos1
        lbData2.text = datos2
        lbData3.text = datos3
        lbData4.text = datos4

    }
    
    
    @IBAction func btInicio(_ sender: Any) {
        
        foto.image = #imageLiteral(resourceName: "CuerposGeometricos")
        lbData1.text = ""
        lbData2.text = ""
        lbData3.text = ""
        lbData4.text = ""
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

