//
//  CreateAccountViewModel.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/3/23.
//

import Foundation
import Alamofire
import PKHUD
import SwiftyJSON
import Toast_Swift

class CreateAccountViewModel: BaseViewController{
    weak var vc_CreateAccount: CreateAccountVC?
    
    //MARK:  ------Create Account------
    func CreateAccountService()  {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        let strUrl = AppUrl.CreateAccountURL()
        
        var dictParam:[String:Any] = [:]
        dictParam = [PARAMS.EMAIL : vc_CreateAccount!.txtEmail.text!,
                     PARAMS.NAME : vc_CreateAccount!.txtFullName.text! ]
        print("dicParam : \(dictParam)")
        
        AF.request(strUrl, method: .post, parameters: dictParam).responseJSON { [self] response in
            PKHUD.sharedHUD.hide()
            
            if response.value != nil {
                let responseJson = JSON(response.value!)
                print("response of get bookmark \(strUrl) = \(responseJson)")
                
                // Accessing the HTTP status code
                if let httpResponse = response.response {
                    let statusCode = httpResponse.statusCode
                    print("HTTP Status Code: \(statusCode)")
                    
                    if statusCode == 200 {
                        if let data = response.data {
                            do {
                                let decodeJSON = JSONDecoder()
                                let dicMainData = try decodeJSON.decode(CreateAccountModel.self, from: data)
                                print("DicMainData : \(dicMainData)")
                                let strMessage = dicMainData.message
                              
                               vc_CreateAccount!.view.makeToast(strMessage)

                                let strUserID  = "\(dicMainData.userID)"
                                Defaults[PDUserDefaults.UserID] = strUserID
                                print("strUserID: \(strUserID)")
                                
                                
                                let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                                self.vc_CreateAccount?.navigationController!.pushViewController(VC, animated: true)
                            }catch {
                                self.vc_CreateAccount?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                            }
                        }else {
                            self.vc_CreateAccount?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                        }
                    }
                }
            }
        }
    }
}

class LoginViewModel: BaseViewController{
    weak var vc_Login: LoginVC?
 
    
    func LoginService()  {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        let strUrl = AppUrl.LoginURL()
        
        var dictParam:[String:Any] = [:]
        dictParam = [PARAMS.EMAIL : vc_Login!.txtMobileOREmail.text!,
                     PARAMS.PASSWORD : vc_Login!.txtPassword.text! ]
        print("dicParam : \(dictParam)")
        
        AF.request(strUrl, method: .post, parameters: dictParam).responseJSON { [self] response in
            PKHUD.sharedHUD.hide()
            
            if response.value != nil {
                let responseJson = JSON(response.value!)
                print("response of Login \(strUrl) = \(responseJson)")
                
                // Accessing the HTTP status code
                if let httpResponse = response.response {
                    let statusCode = httpResponse.statusCode
                    print("HTTP Status Code: \(statusCode)")
                    
                    if statusCode == 200 {
                        if let data = response.data {
                            do {
                                let decodeJSON = JSONDecoder()
                                let dicMainData = try decodeJSON.decode(LoginModel.self, from: data)
                                print("DicMainData : \(dicMainData)")
                                let strMessage = dicMainData.message
                              
                               vc_Login!.view.makeToast(strMessage)

                                let strUserID  = "\(dicMainData.userID)"
                                Defaults[PDUserDefaults.UserID] = strUserID
                                
                                
                                let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                                Defaults[PDUserDefaults.isLogin] =  true //To manage login session
                                self.vc_Login?.navigationController?.pushViewController(VC, animated: true)
                            }catch {
                                self.vc_Login?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                            }
                        }else {
                            self.vc_Login?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                        }
                    }
                }
            }
        }
    }
}

class GetSlotsViewModel: BaseViewController {
    var vc_GetSlots: DeskVC?
    
    var arrSlots = [Slot]()
    
    func GetSlotsService() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        let strUrl = AppUrl.GetSlotsURL()
        
        var dictParam:[String:Any] = [:]
        dictParam = [PARAMS.DATE : "2023-05-02" ]
        print("dicParam : \(dictParam)")
        
        AF.request(strUrl, method: .get, parameters: dictParam).response{ [self] response in
            PKHUD.sharedHUD.hide()
            print("Inside of api integration...",response)
            if response.value != nil {
                print("response was not nil..")
                let responseJson = JSON(response.value!!)
                print("response of get slot \(strUrl) = \(responseJson)")
                
                // Accessing the HTTP status code
                if let httpResponse = response.response {
                    let statusCode = httpResponse.statusCode
                    print("HTTP Status Code: \(statusCode)")
                    
                    if statusCode == 200 {
                        if let data = response.data {
                            do {
                                let decodeJSON = JSONDecoder()
                                let dicMainData = try decodeJSON.decode(GetSlotsModel.self, from: data)
                            
                                let arrTempSlot = dicMainData.slots
                                if arrTempSlot.count > 0 {
                                    self.arrSlots = arrTempSlot
                                    DispatchQueue.main.async {
                                        self.vc_GetSlots?.CVSlots.reloadData()
                                    }
                                }else{
                                    self.arrSlots = []
                                    self.vc_GetSlots?.CVSlots.isHidden = true
                                }
                           }catch {
                                self.vc_GetSlots?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                            }
                        }else {
                            self.vc_GetSlots?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                        }
                    }
                }
            }
        }
        
    }
}

class GetAvailabilityViewModel: BaseViewController {
    weak var vc_GetAvaialability: AvailableDeskVC?
    
    
    var arrGetAvaialability = [Availability]()
    
    func GetAvailabilityService(date: String , slot_id: Int , type: String)  {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        let strUrl = AppUrl.GetAvailabilityURL()
        
        var dictParam:[String:Any] = [:]
        dictParam = [PARAMS.DATE : date ,
                     PARAMS.SLOT_ID : "\(slot_id)" ,
                     PARAMS.TYPE : type  ]
        print("dicParam : \(dictParam)")
        
        AF.request(strUrl, method: .get, parameters: dictParam).response{ [self] response in
            PKHUD.sharedHUD.hide()
            print("Inside of api integration...",response)
            if response.value != nil {
                print("response was not nil..")
                let responseJson = JSON(response.value!!)
                print("response of get slot \(strUrl) = \(responseJson)")
                
                // Accessing the HTTP status code
                if let httpResponse = response.response {
                    let statusCode = httpResponse.statusCode
                    print("HTTP Status Code: \(statusCode)")
                    
                    if statusCode == 200 {
                        if let data = response.data {
                            do {
                                let decodeJSON = JSONDecoder()
                                let dicMainData = try decodeJSON.decode(GetAvailabilityModel.self, from: data)
                            
                                let arrTemp = dicMainData.availability
                                if arrTemp.count > 0 {
                                    arrGetAvaialability = arrTemp
                                 }else{
                                    arrGetAvaialability = []
                                }
                           }catch {
                                self.vc_GetAvaialability?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                            }
                        }else {
                            self.vc_GetAvaialability?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                        }
                    }
                }
            }
        }
    }
    
    func ConfirmBookingService(date: String, slot_id: Int , type: String, workspace_id: Int) {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        let strUrl = AppUrl.ConfirmBookingURL()
        
        var dictParam:[String:Any] = [:]
        dictParam = [PARAMS.DATE : date ,
                     PARAMS.SLOT_ID : "\(slot_id)" ,
                     PARAMS.TYPE : type,
                     PARAMS.WORKSPACE_ID : "\(workspace_id)"
        ]
        print("dicParam : \(dictParam)")
        
        AF.request(strUrl, method: .post, parameters: dictParam).response{ [self] response in
            PKHUD.sharedHUD.hide()
            print("Inside of api integration...",response)
            if response.value != nil {
                print("response was not nil..")
                let responseJson = JSON(response.value!!)
                print("response of get slot \(strUrl) = \(responseJson)")
                
                // Accessing the HTTP status code
                if let httpResponse = response.response {
                    let statusCode = httpResponse.statusCode
                    print("HTTP Status Code: \(statusCode)")
                    
                    if statusCode == 200 {
                        if let data = response.data {
                            do {
                                let decodeJSON = JSONDecoder()
                                let dicMainData = try decodeJSON.decode(ConfirmBookingModel.self, from: data)
                            
                                let strMessage = dicMainData.message
                                self.vc_GetAvaialability?.view.makeToast(strMessage)
                                print("strMessage of confirm booking: \(strMessage)")
                                
                                let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                                self.vc_GetAvaialability?.navigationController?.pushViewController(VC, animated: true)
                           }catch {
                                self.vc_GetAvaialability?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                            }
                        }else {
                            self.vc_GetAvaialability?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                        }
                    }
                }
            }
        }
    }
}
class GetBookingsViewModel: BaseViewController {
    weak var vc_GetBookings: BookingsVC?
    
    var arrBookings = [Booking]()
    
    func GetBookingService()  {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
        
        let strUrl = AppUrl.GetBookingsURL()
        
        var dictParam:[String:Any] = [:]
        dictParam = [PARAMS.USER_ID : Defaults[PDUserDefaults.UserID]  ]
        print("dicParam : \(dictParam)")
        
        AF.request(strUrl, method: .get, parameters: dictParam).response{ [self] response in
            PKHUD.sharedHUD.hide()
            print("Inside of api integration...",response)
            if response.value != nil {
                print("response was not nil..")
                let responseJson = JSON(response.value!!)
                print("response of get slot \(strUrl) = \(responseJson)")
                
                // Accessing the HTTP status code
                if let httpResponse = response.response {
                    let statusCode = httpResponse.statusCode
                    print("HTTP Status Code: \(statusCode)")
                    
                    if statusCode == 200 {
                        if let data = response.data {
                            do {
                                let decodeJSON = JSONDecoder()
                                let dicMainData = try decodeJSON.decode(GetBookingModel.self, from: data)
                            
                                let arrTemp = dicMainData.bookings
                                if arrTemp.count > 0 {
                                    self.arrBookings = arrTemp
                                    DispatchQueue.main.async {
                                        self.vc_GetBookings?.tblView.reloadData()
                                    }
                                }else {
                                    self.arrBookings = []
                                    self.vc_GetBookings?.tblView.isHidden = true
                                }
                           }catch {
                                self.vc_GetBookings?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                            }
                        }else {
                            self.vc_GetBookings?.view.makeToast(responseJson[APIKey.MESSAGE].string)
                        }
                    }
                }
            }
        }
    }
}

