//
//  CreateAccountVC.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/3/23.
//

import UIKit
import Alamofire
import PKHUD
import Toast_Swift
import SwiftyJSON
/*
 Undefined symbol: _$s24DigitalflakeHackathonApp14LoginViewModelCACycfC

 */

class CreateAccountVC: BaseViewController, UITextFieldDelegate {
    
    //MARK: ----IBOutlets-----
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtMobileNumber: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    var ref_CreateAccount = CreateAccountViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ref_CreateAccount.vc_CreateAccount = self
        self.txtMobileNumber.delegate = self
        
   }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == self.txtMobileNumber) {
            let MAX_LENGTH = 10
            let newLength: Int = textField.text!.count + string.count - range.length
            return (newLength <= MAX_LENGTH)
        }else{
            return false
        }
    }
    
    @IBAction func CreateAccountMethod(_ sender: UIButton) {
        CheckValidation()
    }
    
    @IBAction func LogInMethod(_ sender: UIButton) {
        let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController!.pushViewController(VC, animated: true)
    }
    
    func CheckValidation()  {
        guard !txtFullName.text!.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.view.makeToast(TOAST_MESSAGES.FULL_NAME)
            txtFullName.becomeFirstResponder();
            return
        }
        
        guard !txtMobileNumber.text!.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.view.makeToast(TOAST_MESSAGES.MOBILE_NUMBER)
            txtMobileNumber.becomeFirstResponder();
            return
        }
        
        guard !txtEmail.text!.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.view.makeToast(TOAST_MESSAGES.EMAIL)
            txtEmail.becomeFirstResponder();
            return
        }
        self.ref_CreateAccount.CreateAccountService()
    }
    

}

