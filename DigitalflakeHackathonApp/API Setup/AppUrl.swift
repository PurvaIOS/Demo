//
//  AppUrl.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/3/23.
//

import UIKit

class AppUrl: NSObject {
 
 static let mainDomain : String = "https://demo0413095.mockable.io/digitalflake/api/"
    
    class  func CreateAccountURL() -> String {
        return mainDomain + API_NAME.CREATE_ACCOUNT
    }
    
    class  func LoginURL() -> String {
        return mainDomain + API_NAME.CREATE_ACCOUNT
    }
    
    class  func GetSlotsURL() -> String {
        return mainDomain + API_NAME.GET_SLOTS
    }
    
    class  func GetAvailabilityURL() -> String {
        return mainDomain + API_NAME.GET_AVAILABILITY
    }
    
    class  func ConfirmBookingURL() -> String {
        return mainDomain + API_NAME.CONFIRM_BOOKING
    }
   
    class  func GetBookingsURL() -> String {
        return mainDomain + API_NAME.GET_BOOKINGS
    }
}
