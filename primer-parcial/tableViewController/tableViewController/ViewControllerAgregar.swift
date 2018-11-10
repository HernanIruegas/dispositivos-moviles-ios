//
//  ViewControllerAgregar.swift
//  tableViewController
//
//  Created by Hernán Iruegas Villarreal on 19/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

protocol protocoloAgregarJugador{
    
    func agregaJugador( jug : jugador )
    
}

class ViewControllerAgregar: UIViewController {
    
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfPuntos: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    
    var delegado : protocoloAgregarJugador! // el delegado es cualuqier objeto que implemente el protocolo
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)

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
    
    
    @IBAction func gurdarJugador(_ sender: Any) {
        
        if let nom = tfNombre.text,
            let punt = Int(tfPuntos.text!),
            let email = tfEmail.text{
        
            let juga = jugador(nombre: nom, puntos: punt, email: email)
            delegado.agregaJugador(jug: juga)
            
            navigationController?.popViewController(animated: true)  //el navigationController es un stack de view controllers
        }
        
    }
    
    func quitaTeclado() {
        view.endEditing(true)
    }


}
