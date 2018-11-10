//
//  FirstViewController.swift
//  tarea3PickerView
//
//  Created by Hernán Iruegas Villarreal on 05/03/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbLetter: UILabel!
    
    let Array = [[1, 2, 3],
                 [1, 2, 3, 4, 5, 6, 7]]
    
    let numeros = ["1", "2", "3", "4", "5"]
    
    let letras = ["a", "b", "c", "d", "e", "f", "g"]
    
    // Sirve para dividir el picker view en componentes (cantidad de slides)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // Sirve para definir la cantidad de items que tiene cada componente
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if( component == 0){
            return numeros.count
        }else{
            return letras.count
        }
    }
    
    // Sirve para mostrar el item del componente seleccionado
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( component == 0){
            return String(numeros[row])
        }else{
            return String(letras[row])
        }
    }
    
    // Sirve para obtener el valor del item que fue seleccionado por el usuario y así poder ponerlo en las laberl de abajo
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch(component) {
        case 0:
            lbNumber.text = String(describing: numeros[row])
            break
            
        case 1:
            lbLetter.text = String(describing: letras[row])
            break
            
        default:
            break
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

