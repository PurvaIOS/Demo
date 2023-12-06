//
//  BaseViewController.swift
//  LahaWorld
//
//  Created by mac on 15/07/19.
//  Copyright © 2019 shrinkcom. All rights reserved.
//

import UIKit



class BaseViewController: UIViewController {
    var hud = UIView()
    
    func showCustomHUD(){
        hud = UIView().getHUD(spinner: UIActivityIndicatorView())
    }
    
    func hideCustomHUD(){
        hud.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showAnnouncment(withMessage message: String, closer:(()-> Void)? = nil){
        let alertController =   UIAlertController(title: "Snaplify", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction!) in
            closer?()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @available(iOS 13.0, *)
    struct MainClass {
        static let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //Main = User Module
        static let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        //Chef Module
        static let ChefStoryboard = UIStoryboard(name: "Chef", bundle: Bundle.main)
        //Payout Module
        static let PayoutStoryboard = UIStoryboard(name: "Payout", bundle: Bundle.main)
        
        static let PaymentStoryboard = UIStoryboard(name: "Payment", bundle: Bundle.main)
       
    }
    
  /*  func goToUser() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = SJSwiftSideMenuController()
        let sideVC_L : SideMenuVC = (storyBoard.instantiateViewController(withIdentifier: "SideMenuVC") as? SideMenuVC)!
      
        let rootVC = storyBoard.instantiateViewController(withIdentifier: "TabBarControllerVC") as? TabBarControllerVC
        SJSwiftSideMenuController.setUpNavigation(rootController: rootVC!, leftMenuController: sideVC_L, rightMenuController: nil, leftMenuType: .SlideView, rightMenuType: .SlideView)
        
        SJSwiftSideMenuController.enableDimbackground = true
        SJSwiftSideMenuController.leftMenuWidth = (UIScreen.main.bounds.width) - 80
                
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
       
        if #available(iOS 13.0, *){
            if let scene = UIApplication.shared.connectedScenes.first{
                guard let windowScene = (scene as? UIWindowScene) else { return }
                print(">>> windowScene: \(windowScene)")
                let window: UIWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
                window.windowScene = windowScene //Make sure to do this
                window.rootViewController = mainVC
                window.makeKeyAndVisible()
                appDelegate.window = window
            }
        } else {
            appDelegate.window?.rootViewController = mainVC
            appDelegate.window?.makeKeyAndVisible()
        }
    }*/
    
   /* func goToChef() {
        let storyBoard = UIStoryboard(name: "Chef", bundle: nil)
        let mainVC = SJSwiftSideMenuController()
        let sideVC_L : ChefSideMenuVC  = (storyBoard.instantiateViewController(withIdentifier: "ChefSideMenuVC") as? ChefSideMenuVC)!
      
        let rootVC = storyBoard.instantiateViewController(withIdentifier: "ChefTabBarVC") as? ChefTabBarVC
        rootVC?.selectedIndex = 2
        SJSwiftSideMenuController.setUpNavigation(rootController: rootVC!, leftMenuController: sideVC_L, rightMenuController: nil, leftMenuType: .SlideView, rightMenuType: .SlideView)
        
        SJSwiftSideMenuController.enableDimbackground = true
        SJSwiftSideMenuController.leftMenuWidth = (UIScreen.main.bounds.width) - 80
                
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
       
        if #available(iOS 13.0, *){
            if let scene = UIApplication.shared.connectedScenes.first{
                guard let windowScene = (scene as? UIWindowScene) else { return }
                print(">>> windowScene: \(windowScene)")
                let window: UIWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
                window.windowScene = windowScene //Make sure to do this
                window.rootViewController = mainVC
                window.makeKeyAndVisible()
                appDelegate.window = window
            }
        } else {
            appDelegate.window?.rootViewController = mainVC
            appDelegate.window?.makeKeyAndVisible()
        }
    }
    
    func SelectedChefIndex(index: Int) {
        let storyBoard = UIStoryboard(name: "Chef", bundle: nil)
        let mainVC = SJSwiftSideMenuController()
        let sideVC_L : ChefSideMenuVC  = (storyBoard.instantiateViewController(withIdentifier: "ChefSideMenuVC") as? ChefSideMenuVC)!
        
        let rootVC = storyBoard.instantiateViewController(withIdentifier: "ChefTabBarVC") as? ChefTabBarVC
        rootVC?.selectedIndex = index
        SJSwiftSideMenuController.setUpNavigation(rootController: rootVC!, leftMenuController: sideVC_L, rightMenuController: nil, leftMenuType: .SlideView, rightMenuType: .SlideView)
        
        SJSwiftSideMenuController.enableDimbackground = true
        SJSwiftSideMenuController.leftMenuWidth = (UIScreen.main.bounds.width) - 80
                
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
       
        if #available(iOS 13.0, *){
            if let scene = UIApplication.shared.connectedScenes.first{
                guard let windowScene = (scene as? UIWindowScene) else { return }
                print(">>> windowScene: \(windowScene)")
                let window: UIWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
                window.windowScene = windowScene //Make sure to do this
                window.rootViewController = mainVC
                window.makeKeyAndVisible()
                appDelegate.window = window
            }
        } else {
            appDelegate.window?.rootViewController = mainVC
            appDelegate.window?.makeKeyAndVisible()
        }
    }*/
}


extension UIView{
    func getHUD(spinner: UIActivityIndicatorView) -> UIView {
        let window = UIApplication.shared.delegate?.window
        window??.resignFirstResponder()
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.center = (window??.rootViewController?.view.center)!
        spinner.center = view.center
        spinner.startAnimating()
        view.addSubview(spinner)
        window??.addSubview(view)
        return view
    }
}


extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}


