//
//  ViewController.swift
//  mas_de_plist
//
//  Created by Hernán Iruegas Villarreal on 12/03/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let filePath = dataFilePath()
        if FileManager.default.fileExists(atPath: filePath){
            let arreglo = NSArray(contentsOfFile: filePath)!
            tf1.text = arreglo[0] as? String
            tf2.text = arreglo[0] as? String
            tf3.text = arreglo[0] as? String
            tf4.text = arreglo[0] as? String
        }
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(aplicacionTerminara(notification:)), name: .UIApplicationDidEnterBackground, object: app)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func dataFilePath() -> String {
        
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let pathArchivo = url.appendingPathComponent("dataFile.plist")
        
        return pathArchivo.path
    }
    
    @IBAction func aplicacionTerminara(notification: NSNotification) {
        
        let arreglo: NSMutableArray = []
        
        arreglo.add(tf1.text!)
        arreglo.add(tf2.text!)
        arreglo.add(tf3.text!)
        arreglo.add(tf4.text!)
        
        arreglo.write(toFile: dataFilePath(), atomically: true)
    }
    

}

