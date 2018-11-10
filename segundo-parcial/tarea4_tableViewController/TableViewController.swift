//
//  TableViewController.swift
//  tarea4_tableViewController
//
//  Created by Hernán Iruegas Villarreal on 10/03/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

// En esta tarea se combinan los ejercicios de celdas a la medida y de cargar información de un archivo plist

import UIKit

class TableViewController: UITableViewController {
    
    var arrDiccionarios : NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem // para que aparezca el boton de editar

        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        
        arrDiccionarios = NSMutableArray(contentsOfFile: path!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrDiccionarios.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let dic = arrDiccionarios[indexPath.row] as!NSDictionary

        cell.lbTipo.text = dic.object(forKey: "tipo") as! String
        cell.lbCapacidad.text = dic.object(forKey: "capacidad") as! String
        
        let precio = dic.object(forKey: "precio") as! NSNumber
        let formateador = NumberFormatter()
        formateador.numberStyle = .currency
        cell.lbPrecio.text = formateador.string(from: precio)
        
        let sUrl = dic.object(forKey: "urlFoto") as? String
        let url = URL(string: sUrl!)
        let imgData = try? Data(contentsOf: url!)
        cell.ivFoto.image = UIImage(data: imgData!)
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrDiccionarios.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
  
        let temp = arrDiccionarios[fromIndexPath.row]
        arrDiccionarios[fromIndexPath.row] = arrDiccionarios[to.row]
        arrDiccionarios[to.row] = temp
        
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
