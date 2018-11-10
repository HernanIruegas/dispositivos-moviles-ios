//
//  ViewController.swift
//  claseUIView
//
//  Created by Hernán Iruegas Villarreal on 15/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var greyBall: UIImageView!
    @IBOutlet weak var greeting: UILabel!
    @IBOutlet weak var buttons: UISegmentedControl!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var switchState: UISwitch!
    
    // Cambia la posición de la bola
    @IBAction func moveSlider(_ sender: UISlider) {
        
        let coordX = slider.value
        greyBall.frame.origin.x = CGFloat(coordX) * 160
    }

    
    // Cambiar posición de saludo con animación
    @IBAction func pressButton(_ sender: UISegmentedControl) {
        
        switch buttons.selectedSegmentIndex{
        case 0:
            UIView.animate(withDuration: 2) { self.greeting.frame.origin.x = 3 }
        case 1:
             UIView.animate(withDuration: 2) { self.greeting.frame.origin.x = 200 }
        default:
            break;
        }
    }
    
    
    // Cambia el color del background si se presiona el switch
    @IBAction func changeBackground(_ sender: UISwitch) {
        
        if(switchState.isOn){
            viewBackground.backgroundColor =  UIColor . orange
        }else{
            viewBackground.backgroundColor = UIColor .black
        }
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

