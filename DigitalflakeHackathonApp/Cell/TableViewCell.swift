//
//  TableViewCell.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/6/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblDeskID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBookedOn: UILabel!
    
    var get_bookings : Booking?{
        didSet {
            self.GetBookingsCell()
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func GetBookingsCell()  {
        if get_bookings?.workspaceID != 0 {
            self.lblDeskID.text! = "\(String(describing: get_bookings!.workspaceID))"
        }else{
            self.lblDeskID.text! = "0"
        }
        
        if get_bookings?.workspaceName != "" {
            self.lblName.text! = get_bookings!.workspaceName
        }else{
            self.lblName.text! = ""
        }
        
        if get_bookings?.bookingDate != "" {
            self.lblBookedOn.text! = get_bookings!.bookingDate
        }else{
            self.lblBookedOn.text! = ""
        }
    }

}
