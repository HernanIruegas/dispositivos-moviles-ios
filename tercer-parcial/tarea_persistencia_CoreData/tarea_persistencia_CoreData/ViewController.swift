//
//  ViewController.swift
//  tarea_persistencia_CoreData
//
//  Created by Hernán Iruegas Villarreal on 16/04/18.
//  Copyright © 2018 Hernán Iruegas Villarreal. All rights reserved.
//

import UIKit
import CoreData

protocol protocoloAgregarArticulo{
    
    func agregaArticulo( idArticulo: String, descripcion : String, existencia : Int, update : Bool )
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfDescripcion: UITextField!
    @IBOutlet weak var tfCantExistencia: UITextField!
    
    var updateArticle : Bool = false
    var articleId : String!
    var artDescription : String!
    var existencia : Int!

    var delegado : protocoloAgregarArticulo! // el delegado es cualuqier objeto que implemente el protocolo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(updateArticle){ // se quiere editar un articulo ya existente
            tfId.text = articleId
            tfDescripcion.text = artDescription
            tfCantExistencia.text = String(existencia)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeKeyword))
        view.addGestureRecognizer(tap)
    
    }
    
    // Función para quitar el teclado de la pantalla
    func removeKeyword() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func guardar(_ sender: Any) {
        
        let numExistencia = Int(tfCantExistencia.text!)!
        let idArt = tfId.text!
        let artDesc = tfDescripcion.text!
        var update = false
       
        if(updateArticle){ // Se quiere guardar un nuevo articulo
            update = true
        }
        
        delegado.agregaArticulo( idArticulo: idArt, descripcion: artDesc, existencia: numExistencia, update : update)
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

