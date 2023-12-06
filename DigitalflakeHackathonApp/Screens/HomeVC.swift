//
//  HomeVC.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/4/23.
//

import UIKit

class HomeVC: BaseViewController {

    //MARK: ------IBOutlets--------
    @IBOutlet weak var imgBookWorkStation: UIImageView!
    @IBOutlet weak var imgMeetingRoom: UIImageView!
    
    var strType = ""
    //1 = Desks, 2 = Meeting Rooms
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgBookWorkStation.image = UIImage(named: "Book Work Station")
        self.imgMeetingRoom.image = UIImage(named: "Meeting Room")
    }
    
    //MARK: ------Book Work Station-----
    @IBAction func BookWorkStationMethod(_ sender: UIButton) {
       
        self.imgBookWorkStation.image = UIImage(named: "SelectedBookWorkStation")
        self.imgMeetingRoom.image = UIImage(named: "Meeting Room")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "DeskVC") as! DeskVC
            VC.strType = "1"
            self.navigationController!.pushViewController(VC, animated: true)
        }
        
    }
    
    //MARK: -----Meeting Room------
    @IBAction func MeetingRoominMethod(_ sender: UIButton) {
        
        self.imgBookWorkStation.image = UIImage(named: "Book Work Station")
        self.imgMeetingRoom.image = UIImage(named: "SelectedMeetingRoom")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "DeskVC") as! DeskVC
            VC.strType = "2"
            self.navigationController!.pushViewController(VC, animated: true)
        }
    }
    
    //MARK: -------Booking History------
    @IBAction func BookingHistoryMethod(_ sender: UIButtonX) {
        let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "BookingsVC") as! BookingsVC
        self.navigationController!.pushViewController(VC, animated: true)
    }

    
}
