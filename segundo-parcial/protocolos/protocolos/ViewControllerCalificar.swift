//
//  ViewControllerEditar.swift
//  protocolos
//
//  Created by Hernán Iruegas Villarreal on 22/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

protocol protocoloModificaCalificacion{
    
    func modCalificacion(calif: Int, coment: String, indice: Int) -> Void
    
}

class ViewControllerCalificar: UIViewController {
    
    
    @IBOutlet weak var tfNombreAlumno: UITextField!
    @IBOutlet weak var tfCalificacion: UITextField!
    @IBOutlet weak var tvComentarios: UITextView!
    
    var nombreAlumno : String = ""
    var calificacion : Int = 0
    var comentarios : String = ""
    var index : Int = 0

    var delegado : protocoloModificaCalificacion! // el delegado es cualuqier objeto que implemente el protocolo

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Calificar"
        tfNombreAlumno.text = nombreAlumno
        tfCalificacion.text = String(calificacion)
        tvComentarios.text = comentarios
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func calificar(_ sender: Any) {
        delegado.modCalificacion(calif: Int(tfCalificacion.text!)!, coment: tvComentarios.text!, indice: index)
        navigationController?.popToRootViewController(animated: true)

        
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
