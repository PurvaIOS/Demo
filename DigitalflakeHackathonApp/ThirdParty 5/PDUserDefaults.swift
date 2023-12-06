//
//  PDUserDefaults.swift
//  Ripple
//
//  Created by SyncAppData-3 on 20/02/18.
//  Copyright © 2018 SyncAppData-3. All rights reserved.
//




import UIKit

class PDUserDefaults: NSObject {
    
    
    static var UserID = DefaultsKey<String>("UserID")
    static var isLogin = DefaultsKey<Bool>("isLogin")
}
