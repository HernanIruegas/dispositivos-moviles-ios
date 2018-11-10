//
//  TableViewController.swift
//  masterViewController
//
//  Created by Hernán Iruegas Villarreal on 05/03/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

// En este programa se usan celdas a la medida, pero no se carga la información de un archivo plist

import UIKit

class TableViewController: UITableViewController {
    
    var listaEmp = [Empleado]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem // para que aparezca el boton de editar
        
        let emp1 = Empleado(nombre: "David", sueldo: 1000, foto: #imageLiteral(resourceName: "user"), departamento: "languages")
        let emp2 = Empleado(nombre: "Eduardo", sueldo: 2000, foto: #imageLiteral(resourceName: "user"), departamento: "chemistry")
        let emp3 = Empleado(nombre: "Sheko", sueldo: 3000, foto: #imageLiteral(resourceName: "user"), departamento: "math")
        let emp4 = Empleado(nombre: "Hal", sueldo: 4000, foto: #imageLiteral(resourceName: "user"), departamento: "physics")
        
        listaEmp += [emp1, emp2, emp3, emp4] // otra manera de agregar elementos en lugar de usar append

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
        return listaEmp.count
    }

    // Lo que estamos haciendo es utilizar los outlets de la clase cell que nosotros creamos, en lugar de usar los outlets predefinidos por swift
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.lbNombre.text = listaEmp[indexPath.row].nombre
        cell.lbDepartamento.text = listaEmp[indexPath.row].departamento
        
        let sueldo = listaEmp[indexPath.row].sueldo as NSNumber
        let formateador = NumberFormatter()
        formateador.numberStyle = .currency
        cell.lbSueldo.text = formateador.string(from: sueldo)
        
        cell.foto.image = listaEmp[indexPath.row].foto as UIImage
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.white //UIColor(red, green, blue, alpha)
        }
    
        return cell
    }
    
    // Override to support conditional editing of the table view.
    // Sirve para que aprezca la opción de editar a la izquierda del cell
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            listaEmp.remove(at: indexPath.row) // Tienes que borrarlo del arreglo primero, despues de la tabla
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    // Override to support rearranging the table view.
    // Este metodo necesita el de abajo tambien de canMoveRowAt
    // PAra que aparezca las rayitas a la derecha del cell
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let temp = listaEmp[fromIndexPath.row]
        listaEmp[fromIndexPath.row] = listaEmp[to.row]
        listaEmp[to.row] = temp
        
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // Esto es para que la celda tenga una height especifica
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
