//
//  Validation.swift
//  MentajAppFinal
//
//  Created by Dr.Mac on 26/01/21.
//  Copyright © 2021 mac. All rights reserved.
//

import UIKit

class Validation: NSObject
{
    //validation of name
  class func validName(name: String)-> Bool
    {
        let count = name.count
        if count != 0
        {
        return true
        }else{
            return false
        }
    }
    //validation of password is nil or not
    class func validPassword(pass: String)-> Bool
    {
        let count = pass.count
        if count != 0
        {
            return true
        }else{
            return false
        }
    }
    
    //validation of email
  class func isValidEmailAddress(emailAddressString: String) -> Bool
    {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    //validation of phone number
    class func validNumber(number: String)-> Bool
    {
        let countNum = number.count
        if countNum == 10{
            return true
        }else {
            return false
        }
    
    }

// check password and conform pasword
  class  func bothSame(password: String,confirmPassword: String) -> Bool
    {
        if ((password.elementsEqual(confirmPassword)) == true)
         {
            if (password == "" && confirmPassword == "")
            {
                return false
            }else{
                return true
            }
         }
        return false
    }
    

}
