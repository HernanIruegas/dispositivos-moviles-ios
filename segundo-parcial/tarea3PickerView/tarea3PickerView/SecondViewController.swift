//
//  SecondViewController.swift
//  tarea3PickerView
//
//  Created by Hernán Iruegas Villarreal on 05/03/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var foto: UIImageView!
    
    var imagenes = [UIImage]()
    
    // Sirve para dividir el picker view en componentes (cantidad de slides)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Sirve para definir la cantidad de items que tiene cada componente
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imagenes.count
    }
    
    // Sirve para mostrar la imagen 
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var myImageView = UIImageView()
        
        myImageView = UIImageView(image: imagenes[row])
        
        return myImageView
    }
    
    // Sirve para obtener la imagen que fue seleccionada por el usuario y así poder ponerla en el imageView de abajo
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        foto.image = imagenes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
  
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        imagenes.append(#imageLiteral(resourceName: "cherry"))
        imagenes.append(#imageLiteral(resourceName: "crown"))
        imagenes.append(#imageLiteral(resourceName: "lemon"))
        imagenes.append(#imageLiteral(resourceName: "seven"))
        imagenes.append(#imageLiteral(resourceName: "Apple"))
        imagenes.append(#imageLiteral(resourceName: "bar"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

