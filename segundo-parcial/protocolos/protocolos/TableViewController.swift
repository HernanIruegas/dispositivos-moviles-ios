//
//  TableViewController.swift
//  protocolos
//
//  Created by Hernán Iruegas Villarreal on 22/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, protocoloModificaCalificacion {
    
    var listaCalificaciones = [Actividad]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "Alumnos"
        
        var actividad = Actividad(nombreAlum: "David", calif: 80, coment: "Bajo desempeño")
        listaCalificaciones.append(actividad)
        
        actividad = Actividad(nombreAlum: "Eduardo", calif: 70, coment: "Se esperaba mas de el")
        listaCalificaciones.append(actividad)
        
        actividad = Actividad(nombreAlum: "Sheko", calif: 90, coment: "alto desempeño")
        listaCalificaciones.append(actividad)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaCalificaciones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = listaCalificaciones[indexPath.row].nombreAlum
        cell.detailTextLabel?.text = String(listaCalificaciones[indexPath.row].calif)


        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        let viewPrincipal = segue.destination as! ViewController
        
        let indexPath = tableView.indexPathForSelectedRow
        
        viewPrincipal.nombreAlumno = listaCalificaciones[(indexPath?.row)!].nombreAlum
        viewPrincipal.calificacion = listaCalificaciones[(indexPath?.row)!].calif
        viewPrincipal.comentarios = listaCalificaciones[(indexPath?.row)!].coment
        viewPrincipal.index = (indexPath?.row)!
        viewPrincipal.delegado = self
        
    }
    
    // MARK: Metodo de protocolo
    func modCalificacion(calif: Int, coment: String, indice: Int) {
        listaCalificaciones[indice].calif = calif
        listaCalificaciones[indice].coment = coment
        tableView.reloadData()
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
