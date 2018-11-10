//
//  ViewController2.swift
//  SettingsE18
//
//  Created by Yolanda Martinez on 3/26/18.
//  Copyright © 2018 com.itesm. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var swSonido: UISwitch!
    @IBOutlet weak var sliderVolumen: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        swSonido.isOn = defaults.bool(forKey: "sonido")
        sliderVolumen.value = defaults.float(forKey: "volumen")

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        
        defaults.set(swSonido.isOn, forKey: "sonido")
        defaults.set(sliderVolumen.value, forKey: "volumen")
        
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
