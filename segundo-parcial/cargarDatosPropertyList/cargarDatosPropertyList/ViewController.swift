//
//  ViewController.swift
//  cargarDatosPropertyList
//
//  Created by Hernán Iruegas Villarreal on 01/03/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

// En este programa se carga la información de un archivo plist, pero no se trabaja con celdas a la medida

// Un Property list es un xml que permite guardar información
// Se usa solo para cargar datos iniciales

// tienes que conectar el data source y el delegate al view controller porque no estamos usando un tableViewController, solo un tableView
// tienes que hacer una prototype cell y ponerle un identifier
// tienes que usar el los protocoles de tableview

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrDiccionarios : NSArray!
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lbTipo: UILabel!
    @IBOutlet weak var lbCapacidad: UILabel!
    @IBOutlet weak var lbPrecio: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        arrDiccionarios = NSArray(contentsOfFile: path!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrDiccionarios.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let dic = arrDiccionarios[indexPath.row] as!NSDictionary
        
        cell.textLabel?.text = dic.object(forKey: "tipo") as! String
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = arrDiccionarios[indexPath.row] as!NSDictionary
        
        lbTipo.text = dic.object(forKey: "tipo") as! String
        lbCapacidad.text = dic.object(forKey: "capacidad") as! String
        
        let precio = dic.object(forKey: "precio") as! NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        lbPrecio.text = formatter.string(from: precio)
        
        let sUrl = dic.object(forKey: "urlFoto") as? String
        let url = URL(string: sUrl!)
        let imgData = try? Data(contentsOf: url!)
        imgFoto.image = UIImage(data: imgData!)
        
    }

}
















