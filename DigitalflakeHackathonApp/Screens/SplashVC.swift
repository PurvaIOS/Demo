//
//  SplashVC.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/3/23.
//

import UIKit

@available(iOS 13.0, *)
class SplashVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidload of Splash screen...")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.50) {
            self.NavigateScreen()
        }

       
   }
    
//MARK: ----Navigate to create account screen-----
    func NavigateScreen() {
        //Check according to login session Please check this also
   /* if Defaults[PDUserDefaults.isLogin] == true {
            let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.navigationController!.pushViewController(VC, animated: true)
        }else{
            let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "CreateAccountVC") as! CreateAccountVC
            self.navigationController!.pushViewController(VC, animated: true)
        }*/
        
       let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "CreateAccountVC") as! CreateAccountVC
       self.navigationController!.pushViewController(VC, animated: true)
    }
}
