//
//  ViewController.swift
//  actDivisas
//
//  Created by Hernán Iruegas Villarreal on 11/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tipoCambio: UITextField!
    @IBOutlet weak var tpPesos: UITextField!
    @IBOutlet weak var tpDolares: UITextField!
    @IBOutlet weak var imagen: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagen.image = #imageLiteral(resourceName: "dollar-sign")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func calcular(_ sender: UIButton) {
        
        if let atipoCambio = Double(tipoCambio.text!),
            let pesos = Double(tpPesos.text!){
            
            let dolares = pesos / atipoCambio
            tpDolares.text = "\(dolares)"
            
        }else{
            
            let alerta = UIAlertController(title: "Error", message: "Los campos deben tener valor númerico", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))//UIAlertAction es lo que quieres que pase depsues de la alerta (formato de algo entre () -> Void)
            
            present(alerta, animated: true, completion: nil)
            
            tpDolares.text = ""
        
        }
        
    }
    
    @IBAction func quitaTeclado(){
        
        view.endEditing(true)
        
    }
    
    
}

