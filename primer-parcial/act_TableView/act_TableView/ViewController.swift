//
//  ViewController.swift
//  act_TableView
//
//  Created by Hernán Iruegas Villarreal on 01/02/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lista = ["a","b","c","d"]
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodods de Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        cell.textLabel?.text = lista[indexPath.row]
        cell.detailTextLabel?.text = "\(indexPath.row)"
        cell.imageView?.image = #imageLiteral(resourceName: "basket")
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewDetalle = segue.destination as! UIViewControllerDetalle
        
        let indexPath = tableView.indexPathForSelectedRow
        
        viewDetalle.datos = lista[(indexPath?.row)!]
    }
    
    

}

