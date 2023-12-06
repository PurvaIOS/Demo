//
//  Utility.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/5/23.
//

import Foundation


class Utility {
   static func convertDateFormat(inputDate: String) -> String? {
        
        let inputFormatter = Foundation.DateFormatter()
        inputFormatter.dateFormat = "MM/dd/yy"
        if let date = inputFormatter.date(from: inputDate) {
            let outputFormatter = Foundation.DateFormatter()
            outputFormatter.dateFormat = "E dd MMM"//"E YYYY-MM-dd"//"YYYY-MM-dd"
            let outputDate = outputFormatter.string(from: date)
            return outputDate
        } else {
            print("Error parsing input date")
            return nil
        }
    }
    
    static func convertDateFormatNew(inputDate: String) -> String? {
         
         let inputFormatter = Foundation.DateFormatter()
         inputFormatter.dateFormat = "MM/dd/yy"
         if let date = inputFormatter.date(from: inputDate) {
             let outputFormatter = Foundation.DateFormatter()
             outputFormatter.dateFormat = "YYYY-MM-dd"
             let outputDate = outputFormatter.string(from: date)
             return outputDate
         } else {
             print("Error parsing input date")
             return nil
         }
     }
}
