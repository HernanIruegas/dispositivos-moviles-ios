//
//  FifthViewController.swift
//  tabBar
//
//  Created by Hernán Iruegas Villarreal on 26/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

// se le puso show al segue porque ya eixiste un navigation controller

class FifthViewController: UIViewController {

    
    
    @IBOutlet weak var lbDatoMostrar: UILabel!
    
    var datoMostrar : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lbDatoMostrar.text = datoMostrar
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

}
