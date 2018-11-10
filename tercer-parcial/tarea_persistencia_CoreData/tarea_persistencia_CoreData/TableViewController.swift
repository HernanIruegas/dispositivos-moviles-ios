//
//  TableViewController.swift
//  tarea_persistencia_CoreData
//
//  Created by Hernán Iruegas Villarreal on 16/04/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, protocoloAgregarArticulo {
    
    var results : [AnyObject] = [] // para almacenar todos los objetos recibidos del fetch request (todos los objetos de los articulos)
    var newArticle : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newArticle = false
        print("viewdidload")
        print(newArticle)

        // variables para manipular CoreData
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //Aqui se insertan temas a ala aplicacion -->
        
        
        for index in 1...7{
            
            let newTopic = NSEntityDescription.insertNewObject(forEntityName: "Articulos", into: context)
            newTopic.setValue(String(index), forKey: "id")
            newTopic.setValue("este articulo", forKey: "descripcion")
            newTopic.setValue(5, forKey: "existencia")
            
            do {
                try context.save()
                print("Saved")
            } catch {
                print("There was an error")
            }
        
        }
        
        // Hacer fetch para obtener los articulos guardados en CoreData
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Articulos")
        request.returnsObjectsAsFaults = false
        
        do {
            results = try context.fetch(request)
            
            if results.count > 0 {
                print("Articles found")
            }else {
                print("No results")
            }
        }catch {
            print("Couldn't fetch results")
        }
        
        
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
        return results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Indica el indice de la fila de la tabla
        let tempIndex = indexPath.row
        
        cell.textLabel?.text = results[tempIndex].value(forKey: "descripcion") as! String
        cell.detailTextLabel?.text = results[tempIndex].value(forKey: "id") as! String
      
        return cell
    }
    
    
    @IBAction func addArticle(_ sender: Any) {
        
        newArticle = true // para definir que el segue se realiza porque se toma una foto nueva
        performSegue(withIdentifier: "article", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "article"{
            
            let viewArticle = segue.destination as! ViewController
            viewArticle.delegado = self // hacemos que la variable delegado de ViewController apunte a este view controller (TableViewController)
            
            if(newArticle){ // se quiere agregar un nuevo articulo
    
                viewArticle.updateArticle = false
                newArticle = false
                
            }else{ // la nota se queire editar solamente
                
                let indexPath = tableView.indexPathForSelectedRow
                let selectedRow = indexPath?.row
                
                let article = results[ selectedRow! ] // conseguir el articulo seleccionado desde el arreglo de articulos
                
                viewArticle.articleId = article.value(forKey: "id") as? String
                viewArticle.artDescription = article.value(forKey: "descripcion") as? String
                viewArticle.existencia = article.value(forKey: "existencia") as? Int

                viewArticle.updateArticle = true // para identificar que el articulo se quiere actualizar
            }
        }
    }
    
    // implementar la funcion del protocolo
    func agregaArticulo( idArticulo: String, descripcion : String, existencia : Int, update : Bool){
        
        // variables para manipular CoreData
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if(!update){
            
            // guadar nuevo articulo
            let newTopic = NSEntityDescription.insertNewObject(forEntityName: "Articulos", into: context)
            newTopic.setValue(idArticulo, forKey: "id")
            newTopic.setValue(descripcion, forKey: "descripcion")
            newTopic.setValue(existencia, forKey: "existencia")
            
            do {
                try context.save()
                print("Saved")
            } catch {
                print("There was an error")
            }
            
        }else{
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Articulos")
            request.returnsObjectsAsFaults = false
            
            request.predicate = NSPredicate(format: "id = %@", idArticulo )//this lets us look for specific data
            
            do {
                
                let results = try context.fetch(request) // obtener contenido
                
                if results.count == 1 { // Se encontro el registro unico correcto
                    
                    let objectUpdate = results[0] as! NSManagedObject // obtener el objeto a actualizar
                    
                    // no se si debo updatear todos los campos, o solo los que van a cambiar
                    objectUpdate.setValue(idArticulo, forKey: "id")
                    objectUpdate.setValue(descripcion, forKey: "descripcion")
                    objectUpdate.setValue(Int(existencia), forKey: "existencia")
                    do{
                        try context.save()
                    }
                    catch
                    {
                        print(error)
                    }
                    
                }else {
                    print("No results")
                }
            }catch {
                print("Couldn't fetch results")
            }
            
        }
        
        // Hacer fetch para obtener los articulos updateados en CoreData
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Articulos")
        request.returnsObjectsAsFaults = false
        
        do {
            results = try context.fetch(request)
            
            if results.count > 0 {
                print("Articles found")
            }else {
                print("No results")
            }
        }catch {
            print("Couldn't fetch results")
        }
        
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
