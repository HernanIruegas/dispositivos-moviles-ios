//
//  ViewControllerInformacion.swift
//  act_storyboard
//
//  Created by Hernán Iruegas Villarreal on 25/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewControllerInformacion: UIViewController {
    
    
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lbAncho: UILabel!
    @IBOutlet weak var lbAltura: UILabel!
    
    var image: UIImage!
    var ancho: CGFloat!
    var altura: CGFloat!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgFoto.image = image
        lbAncho.text = String(describing: ancho!)
        lbAncho.text = String(describing: altura!)
        
        
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
