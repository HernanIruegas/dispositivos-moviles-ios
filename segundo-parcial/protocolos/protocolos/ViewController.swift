//
//  ViewController.swift
//  protocolos
//
//  Created by Hernán Iruegas Villarreal on 22/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lbNombreAlumno: UILabel!
    @IBOutlet weak var lbCalificacion: UILabel!
    @IBOutlet weak var tvComentarios: UITextView!
    
    var nombreAlumno : String = ""
    var calificacion : Int = 0
    var comentarios : String = ""
    var index : Int = 0
    
    var delegado : protocoloModificaCalificacion!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lbNombreAlumno.text = nombreAlumno
        lbCalificacion.text = String(calificacion)
        tvComentarios.text = comentarios
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vistaCalif = segue.destination as! ViewControllerCalificar
        vistaCalif.calificacion = calificacion
        vistaCalif.comentarios = comentarios
        vistaCalif.nombreAlumno = nombreAlumno
        vistaCalif.index = index
        vistaCalif.delegado = delegado
    }


}

