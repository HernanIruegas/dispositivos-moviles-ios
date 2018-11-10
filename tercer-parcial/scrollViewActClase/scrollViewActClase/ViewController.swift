//
//  ViewController.swift
//  scrollViewActClase
//
//  Created by Hernán Iruegas Villarreal on 12/04/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

// Para poner zoom en scrollView tienees que cambiar el min y max al seleccionar el scrollView

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imageView : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imagen = #imageLiteral(resourceName: "paisaje1")
        imageView = UIImageView( image: imagen )
        scrollView.addSubview( imageView )
        scrollView.contentSize = (imagen.size)
        
        let punto = CGPoint(x:500, y:250)
        scrollView.setContentOffset(punto, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }


}

