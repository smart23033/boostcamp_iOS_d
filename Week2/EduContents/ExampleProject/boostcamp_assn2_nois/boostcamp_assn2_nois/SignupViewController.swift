//
//  SignupViewController.swift
//  boostcamp_assn2
//
//  Created by Yoo Seok Kim on 2017. 7. 11..
//  Copyright © 2017년 Nois. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    //Mark: Properties
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var checkPwdTextField: UITextField!
    @IBOutlet weak var introduceTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        pwdTextField.delegate = self
        checkPwdTextField.delegate = self
        introduceTextView.delegate = self
    }
    
    // MARK: UIImageView Delegater
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        profileImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: UITextView Delegater
    func textView(_ shouldChangeTextIntextView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            introduceTextView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        if textField == idTextField {
            pwdTextField.becomeFirstResponder()
        } else if textField == pwdTextField {
            checkPwdTextField.becomeFirstResponder()
        } else if textField == checkPwdTextField {
            introduceTextView.becomeFirstResponder()
        }
        return true
    }
    
    //Mark: Actions
    @IBAction func cancelSignup(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func requestSignup(_ sender: UIButton) {
        if let id = idTextField.text,
            let pwd = pwdTextField.text,
            let checkPwd = checkPwdTextField.text {
            
            if(id.isEmpty || pwd.isEmpty || checkPwd.isEmpty) {
                var alertMsg = ""
                
                if(id.isEmpty) {
                    alertMsg += "id"
                }
                else if(pwd.isEmpty) {
                    alertMsg += "password"
                } else if(checkPwd.isEmpty) {
                    alertMsg += "check password"
                }
                
                alertMsg += "를 입력해 주세요"
                let alert = UIAlertController(title: "Fail to signup", message: alertMsg, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            if(pwd == checkPwd) {
                dismiss(animated: true, completion: nil)
            }
            else {
                print("password가 일치하지 않습니다.")
            }
        }
    }
    
    @IBAction func selectProfileImage(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

