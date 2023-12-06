//
//  AvailableDeskVC.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/5/23.
//

import UIKit

class AvailableDeskVC: BaseViewController {
    
    @IBOutlet weak var CVAvailabelDesk: UICollectionView!
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var viewOuter: UIView!
    
    @IBOutlet weak var lblDeskID: UILabel!
    @IBOutlet weak var lblDeskNum: UILabel!
    @IBOutlet weak var lblSlot: UILabel!
    @IBOutlet weak var lblHeadingAvailableDesk: UILabel!
    
    @IBOutlet weak var lblTitleDeskRoomId: UILabel!
    @IBOutlet weak var lblTitleDeskRoom: UILabel!
    
    
    var strDate = ""
    var strSlotID = 0
    var strSlotName = ""
    var strType = ""
    var strDisplayDate = ""

    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var currentSelected:Int?
    var intDeskNumber = 0
    let arrNumbersArray = Array(1...40)
    
    var ref_GetAvailable = GetAvailabilityViewModel()

    var strWorkSpaceID = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Type: \(self.strType)")
        self.viewOuter.isHidden = true
        self.DisplayHeading(type: self.strType)
        self.DisplayDateTime()
        self.SetupCells()
        self.ref_GetAvailable.vc_GetAvaialability = self
        self.ref_GetAvailable.GetAvailabilityService(date: strDate, slot_id: strSlotID, type: strType)
    }
    
    func DisplayHeading(type: String) {
        print("Type: \(type)")
        
        if type == "1" {
            self.lblHeadingAvailableDesk.text! = "Available desks"
            self.lblTitleDeskRoomId.text! = "Desk ID :"
        }else {
            self.lblHeadingAvailableDesk.text! = "Available rooms"
            self.lblTitleDeskRoomId.text! = "Room ID :"
        }
        
    }
    
    func SetupCells()  {
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: ((screenWidth-10)/6), height: 60)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        CVAvailabelDesk!.collectionViewLayout = layout
    }
    
    func DisplayDateTime()  {
        self.lblDateTime.text! = self.strDisplayDate + "," + self.strSlotName
        print("lblDateTime: \(self.lblDateTime.text!)")
    }
    
    @IBAction func BackMethod(_ sender: UIButton) {
       self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func BookDeskMethod(_ sender: UIButtonX) {
       
        
        if self.intDeskNumber != 0 {
            self.viewOuter.isHidden = false
            for i in ref_GetAvailable.arrGetAvaialability {
                let id =  i.workspaceID
                print("i: \(id)")
                self.strWorkSpaceID = id
            }
            self.ShowPopupData()
        }else{
            print("Please select desk first")
            self.view.makeToast("Please select desk first")
        }
    }
    
    func ShowPopupData() {
        self.lblDeskID.text = "\(self.strWorkSpaceID)"
        
        if self.strType == "1" {
            self.lblDeskNum.text! = "Desk " + "\(self.intDeskNumber)"
        }else{
            self.lblDeskNum.text! = "Room No. " + "\(self.intDeskNumber)"
        }
        
        self.lblSlot.text! = self.lblDateTime.text!
    }
    
    @IBAction func CloseMethod(_ sender: UIButton) {
        self.viewOuter.isHidden = true
    }
    @IBAction func ConfirmNookingMethod(_ sender: UIButtonX) {
        self.ref_GetAvailable.ConfirmBookingService(date: self.strDate, slot_id: self.strSlotID, type: self.strType, workspace_id: strWorkSpaceID)
    }
}

extension AvailableDeskVC: UICollectionViewDelegate , UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNumbersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (self.CVAvailabelDesk.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell)!
        cell.lblSlots.text! = "\(self.arrNumbersArray[indexPath.item])"
        
        cell.viewSlotsBg.backgroundColor = currentSelected == indexPath.item ? UIColor.customColor : UIColor.customColor_NonSelected
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dicData = self.arrNumbersArray[indexPath.item]
        self.intDeskNumber = dicData

        currentSelected = indexPath.item
        CVAvailabelDesk.reloadData()
        
//        let dicDataNew = ref_GetAvailable.arrGetAvaialability[indexPath.item]
//        self.strWorkSpaceID = dicDataNew.workspaceID
    }
}
