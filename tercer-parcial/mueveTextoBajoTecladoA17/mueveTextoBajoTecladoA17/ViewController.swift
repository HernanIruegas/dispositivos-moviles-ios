//
//  ViewController.swift
//  mueveTextoBajoTecladoA17
//
//  Created by Yolanda Martinez on 10/29/17.
//  Copyright © 2017 com.itesm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfApPaterno: UITextField!
    @IBOutlet weak var tfApMaterno: UITextField!
    @IBOutlet weak var tfEdad: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var activeField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(quitaTeclado))
        self.view.addGestureRecognizer(tap)
        self.registrarseParaNotificacionesDeTeclado()
    }

    func registrarseParaNotificacionesDeTeclado() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWasShown(aNotification:)),
                                               name:NSNotification.Name.UIKeyboardWillShow, object:nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillBeHidden(aNotification:)),
                                               name:NSNotification.Name.UIKeyboardWillHide, object:nil)
    }

    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }
    
    @IBAction func keyboardWasShown(aNotification : NSNotification) {
        
        let kbSize = (aNotification.userInfo![UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size
        
        let contentInset = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset

        // If active text field is hidden by keyboard, scroll it so it's visible
        // Your app might not need or want this behavior.
        var aRect: CGRect = scrollView.frame
        aRect.size.height -= kbSize.height
        if !aRect.contains(activeField.frame.origin) {
            scrollView.scrollRectToVisible(activeField.frame, animated: true)
        }
    }

    // Called when the UIKeyboardWillHideNotification is sent
    @IBAction func keyboardWillBeHidden(aNotification : NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    // OJO poner atención a este comentario
    // Each text field in the interface sets the view controller as its delegate.
    // Therefore, when a text field becomes active, it calls these methods.
    func textFieldDidBeginEditing (_ textField : UITextField )
    {
        activeField = textField
    }
    
    func textFieldDidEndEditing (_ textField : UITextField )
    {
        activeField = nil
    }
    
}

