//
//  ViewController.swift
//  boostcamp_assn1
//
//  Created by Yoo Seok Kim on 2017. 7. 2..
//  Copyright © 2017년 Nois. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Mark: Properties
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        pwdTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if textField == idTextField {
            pwdTextField.becomeFirstResponder()
        }
        return true
    }
    
    //Mark: Actions
    @IBAction func SignIn(_ sender: UIButton) {
        if let id: String = idTextField.text,
            let pwd: String = pwdTextField.text {
            print("id: \(id), pwd: \(pwd)")
        }
    }
}


