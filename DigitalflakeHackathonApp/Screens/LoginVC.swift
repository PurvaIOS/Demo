//
//  LoginVC.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/3/23.
//

import UIKit


class LoginVC: BaseViewController {
    
    //MARK: ----IBOutlets-----
    @IBOutlet weak var txtMobileOREmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnPasswordShowHide: UIButton!
    
    var ref_Login = LoginViewModel()
    var iconClick = true

    override func viewDidLoad() {
        super.viewDidLoad()
        ref_Login.vc_Login = self
        
        /*self.txtMobileOREmail.text! = "purva@gmail.com"
        self.txtPassword.text! = "123456"*/
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == self.txtMobileOREmail) {
            let MAX_LENGTH = 10
            let newLength: Int = textField.text!.count + string.count - range.length
            return (newLength <= MAX_LENGTH)
        }else{
            return false
        }
    }
    
    @IBAction func LoginMethod(_ sender: UIButton) {
        CheckValidation()
    }
    
    @IBAction func PasswordShowHideMethod(_ sender: UIButton) {
        if iconClick {
            txtPassword.isSecureTextEntry = false
            self.btnPasswordShowHide.setImage(UIImage(named: "OpenEye"), for: .normal)
        } else {
            txtPassword.isSecureTextEntry = true
            self.btnPasswordShowHide.setImage(UIImage(named: "Password_Eye"), for: .normal)
        }
        iconClick = !iconClick
    }
    
    @IBAction func CreateAccountMethod(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }

    func CheckValidation()  {
        guard !txtMobileOREmail.text!.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.view.makeToast(TOAST_MESSAGES.MOBILE_OR_EMAIL)
            txtMobileOREmail.becomeFirstResponder();
            return
        }
        
        guard !txtPassword.text!.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.view.makeToast(TOAST_MESSAGES.PASSWORD)
            txtPassword.becomeFirstResponder();
            return
        }
        ref_Login.LoginService()
    }
    
   

}
