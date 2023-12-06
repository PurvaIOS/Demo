//
//  BookingsVC.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/6/23.
//

import UIKit

class BookingsVC: BaseViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var ref_Bookings = GetBookingsViewModel()
    var cell: TableViewCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref_Bookings.vc_GetBookings = self
        self.ref_Bookings.GetBookingService()
        
    }
    
    @IBAction func BackMethod(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
}

extension BookingsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ref_Bookings.arrBookings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = (self.tblView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell)!
        let dicObject = self.ref_Bookings.arrBookings[indexPath.row]
        cell!.get_bookings = dicObject
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }

    
}
