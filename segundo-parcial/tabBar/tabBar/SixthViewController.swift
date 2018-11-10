//
//  SixthViewController.swift
//  tabBar
//
//  Created by Hernán Iruegas Villarreal on 26/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {
    
    
    @IBOutlet weak var tfDatoLogin: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationControllerView = segue.destination as! UINavigationController
        
        let tableViewController = navigationControllerView.topViewController as! FourthTableViewController
        
        tableViewController.datoMostrar = tfDatoLogin.text!
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
