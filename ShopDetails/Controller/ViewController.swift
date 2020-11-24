//
//  ViewController.swift
//  ShopDetails
//
//  Created by developer on 23/11/20.
//  Copyright © 2020 blockchain. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var mobileNumTxtFld : UITextField!
    @IBOutlet var signInBtn : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Sign In"
        mobileNumTxtFld.keyboardType = UIKeyboardType.numberPad
        Extensions.getResponse()
        signInBtn.addTarget(self, action: #selector(self.signInBtnTapped), for: UIControl.Event.touchUpInside)
        
    }
  
    @objc  func signInBtnTapped()->Void
    {
        //Done button tapped
        self.view.endEditing(true)
        
        //Validations
        if mobileNumTxtFld.text == nil || mobileNumTxtFld.text == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Please Enter your Mobile Number", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            Extensions.setUserMobileNumber(mobileNumTxtFld.text!)
            let deviceVC = self.storyboard?.instantiateViewController(withIdentifier: "DeviceTypeViewController") as! DeviceTypeViewController
            self.navigationController?.pushViewController(deviceVC, animated: true)
        }
    }
    /**
     TextField delegate, called when text field text is changed.Can process conditions to set the textField text limit.
     - Parameter textField:The textField which currently focused.
     */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == mobileNumTxtFld
        {
            let newLength = (textField.text?.count)! + string.count - range.length
            
            if newLength <= 10
            {
                let newCharacters = CharacterSet(charactersIn: string)
                return CharacterSet.decimalDigits.isSuperset(of: newCharacters)
            }
            else
            {
                return false
            }
            
        }
        else if !Extensions.isValidMobileNumber(mobileNumTxtFld.text!)
        {
            let alert = UIAlertController(title: "Alert", message: "Please enter valid mobile number", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        return true
    }


}
