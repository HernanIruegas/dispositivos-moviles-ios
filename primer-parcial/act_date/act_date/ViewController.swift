//
//  ViewController.swift
//  act_date
//
//  Created by Hernán Iruegas Villarreal on 22/01/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var typeOfDate: UISegmentedControl!
    @IBOutlet weak var dayOrMonth: UILabel!
    @IBOutlet weak var dayNumber: UILabel!
    @IBOutlet weak var year: UILabel!
    
    // Objeto global de tipo fecha
    var fecha = Date()
    let formateador = DateFormatter()
    
    func optionsSegmentedControl(fechaDividida: [String]){
        
        switch typeOfDate.selectedSegmentIndex{
        case 0:
            dayOrMonth.text = fechaDividida[1].components(separatedBy: " ")[1]
            dayNumber.text = fechaDividida[1].components(separatedBy: " ")[2]
            year.text = fechaDividida[2]
        case 1:
            dayOrMonth.text = fechaDividida[0]
            dayNumber.text = fechaDividida[1].components(separatedBy: " ")[2]
            year.text = fechaDividida[1].components(separatedBy: " ")[1] + "," + fechaDividida[2]
        default:
            break;
        }
        
    }

    
    @IBAction func changeFormatDate(_ sender: Any) {
        
        formateador.dateStyle = DateFormatter.Style.full
        let fechaString = formateador.string(from:fecha)
        let fechaDividida = fechaString.components(separatedBy: ",") // Para dividir el string de la fecha en partes y así tener los datos de manera individual
        
        switch typeOfDate.selectedSegmentIndex{
        case 0:
            dayOrMonth.text = fechaDividida[1].components(separatedBy: " ")[1]
            dayNumber.text = fechaDividida[1].components(separatedBy: " ")[2]
            year.text = fechaDividida[2]
        case 1:
            dayOrMonth.text = fechaDividida[0]
            dayNumber.text = fechaDividida[1].components(separatedBy: " ")[2]
            year.text = fechaDividida[1].components(separatedBy: " ")[1] + "," + fechaDividida[2]
        default:
            break;
        }
        
    }
    
    
    @IBAction func fwdOneDay(_ sender: Any) {
        
        fecha = fecha.addingTimeInterval(86400) // Actualizar la variable fecha
        formateador.dateStyle = DateFormatter.Style.full
        let fechaString = formateador.string(from:fecha)
        let fechaDividida = fechaString.components(separatedBy: ",")
        
        optionsSegmentedControl(fechaDividida: fechaDividida)
        
    }
    
    @IBAction func fwdOneWeek(_ sender: Any) {
        
        fecha = fecha.addingTimeInterval(604800) // Actualizar la variable fecha
        formateador.dateStyle = DateFormatter.Style.full
        let fechaString = formateador.string(from:fecha)
        let fechaDividida = fechaString.components(separatedBy: ",")
        
        optionsSegmentedControl(fechaDividida: fechaDividida)
        
    }
    
    
    @IBAction func backOneDay(_ sender: Any) {
        
        fecha = fecha.addingTimeInterval(-86400) // Actualizar la variable fecha
        formateador.dateStyle = DateFormatter.Style.full
        let fechaString = formateador.string(from:fecha)
        let fechaDividida = fechaString.components(separatedBy: ",")
        
        optionsSegmentedControl(fechaDividida: fechaDividida)
        
    }
    
    
    @IBAction func backOneWeek(_ sender: Any) {
        
        fecha = fecha.addingTimeInterval(-604800) // Actualizar la variable fecha
        formateador.dateStyle = DateFormatter.Style.full
        let fechaString = formateador.string(from:fecha)
        let fechaDividida = fechaString.components(separatedBy: ",")
        
        optionsSegmentedControl(fechaDividida: fechaDividida)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        formateador.dateStyle = DateFormatter.Style.full
        let fechaString = formateador.string(from:fecha)
        let fechaDividida = fechaString.components(separatedBy: ",")
        
        optionsSegmentedControl(fechaDividida: fechaDividida)
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

