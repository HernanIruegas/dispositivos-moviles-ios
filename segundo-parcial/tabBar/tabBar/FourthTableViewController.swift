//
//  FourthTableViewController.swift
//  tabBar
//
//  Created by Hernán Iruegas Villarreal on 26/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

// Para tener el navigation controller debes seleccionar el tableViewControle, irte a la prte de arriba a la sección de editor, luego ir a embed in, luego seleccionar navigationControll

class FourthTableViewController: UITableViewController {
    
    var lista = ["1", "2", "3", "4", "5"]
    
    var datoMostrar : String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lista.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = lista[indexPath.row]

        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let vistaCinco = segue.destination as! FifthViewController
        
        let SelectedIndexPath = tableView.indexPathForSelectedRow!
        
        vistaCinco.datoMostrar = lista[SelectedIndexPath.row] + "---" + datoMostrar
        
        
    }
    
    
    @IBAction func regresarVistaAnterior(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

}
