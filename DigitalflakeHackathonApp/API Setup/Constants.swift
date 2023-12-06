//
//  Constants.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/3/23.
//

import Foundation

struct APIKey {
    static let STATUS = "status"
    static let MESSAGE = "message"
}

struct API_NAME {
    static let CREATE_ACCOUNT = "create_account"
    static let LOGIN = "login"
    static let GET_SLOTS = "get_slots"
    static let GET_AVAILABILITY = "get_availability"
    static let CONFIRM_BOOKING = "confirm_booking"
    static let GET_BOOKINGS = "get_bookings"
   
}

struct PARAMS {
    static let EMAIL =  "email"
    static let NAME =  "name"
    
    static let PASSWORD = "password"
    
    static let DATE = "date"
    static let SLOT_ID = "slot_id"
    static let TYPE = "type"
    static let WORKSPACE_ID = "workspace_id"
    static let USER_ID = "user_id"
    
}

struct TOAST_MESSAGES {
    static let FULL_NAME =  "Please enter name"
    static let MOBILE_NUMBER =  "Please enter mobile number"
    static let EMAIL = "Please enter email address"
    
    static let MOBILE_OR_EMAIL = "Please enter mobile num or email"
    static let PASSWORD = "Please enter password"
    
    
}
