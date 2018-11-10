//
//  ViewController.swift
//  popOverActClase
//
//  Created by Hernán Iruegas Villarreal on 12/04/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

// El tamaño de la vista popOver generalmente es mas pequeño que el tamaño de la vista completa.

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var dato : String = ""

    @IBOutlet weak var lbDato: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        preferredContentSize = CGSize(width: 250, height:150)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func adaptivePresentationStyle (for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaPopOver = segue.destination as! ViewControllerPopOver
        vistaPopOver.popoverPresentationController!.delegate = self
    }
    
    func actualizaDato(){
        lbDato.text = dato
    }

}

