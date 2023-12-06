//
//  DeskVC.swift
//  DigitalflakeHackathonApp
//
//  Created by user242471 on 12/4/23.
//

import UIKit
import AYHorindar
import Foundation


class DeskVC: BaseViewController {
    
    //MARK: ------IBOutlets--------
    @IBOutlet weak var CVSlots: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    var currentSelected:Int?
    var ref_GetSlots = GetSlotsViewModel()
    var strType = ""
    var slot_id = 0
    var strSlotName = ""
    var strShowDateTime = ""
    var strDate = ""
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    private let horindarViewController = AYHorindarViewController()
    var arrSelectedIndex = [IndexPath]()
    var arrSelectedData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CVSlots.delegate = self
        self.CVSlots.dataSource = self
        self.ref_GetSlots.vc_GetSlots = self
        self.ref_GetSlots.GetSlotsService()
        
        self.CalenderSetup()
        self.SetupCells()
   }
    
    func CalenderSetup() {
        horindarViewController.delegate = self
        horindarViewController.dataSource = self
        horindarViewController.uiDelegate = self
        containerView.addSubview(horindarViewController.view)
        containerView.addAllSidesAnchors(to: horindarViewController.view)
    }
    
    func SetupCells()  {

        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0

        layout.itemSize = CGSize(width: ((screenWidth-10)/2), height: 60)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        CVSlots!.collectionViewLayout = layout
    }
   
    @IBAction func BackMethod(_ sender: UIButton) {
       self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func NextMethod(_ sender: UIButton) {
        let VC = MainClass.mainStoryboard.instantiateViewController(withIdentifier: "AvailableDeskVC") as! AvailableDeskVC
        VC.strDate = self.strDate
        VC.strType = self.strType
        VC.strSlotID = self.slot_id
        VC.strSlotName = self.strSlotName
        
        VC.strDisplayDate = self.strShowDateTime
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

extension DeskVC: AYHorindarDataSource { }

extension DeskVC: AYHorindarUIDelegate {
    
}

extension DeskVC: AYHorindarDelegate {
  func current(date: Date) {
      let strDate  = date.log
      let strDay = date.dayOfWeek()!
      print("strDate: \(strDate)")
      print("strDay: \(strDay)")
    
      if let convertedShowDate = Utility.convertDateFormat(inputDate: strDate) {
          print("convertedShowDate date: \(convertedShowDate)")
          self.strShowDateTime = convertedShowDate
      } else {
          print("Conversion failed")
      }
      
      if let converted_date = Utility.convertDateFormatNew(inputDate: strDate) {
          print("convertedShowDate date: \(converted_date)")
          self.strDate = converted_date
      }else {
          print("Conversion failed for date passing")
      }
   }
}


extension DeskVC: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ref_GetSlots.arrSlots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (self.CVSlots.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell)!
        
        let dicObject = self.ref_GetSlots.arrSlots[indexPath.item]
        
        if dicObject.slotName != "" {
            cell.lblSlots.text! = dicObject.slotName
        }else{
            cell.lblSlots.text! = ""
        }

        cell.viewSlotsBg.backgroundColor = currentSelected == indexPath.item ? UIColor.customColor : UIColor.customColor_NonSelected
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     if self.strShowDateTime != "" {
            let strData = self.ref_GetSlots.arrSlots[indexPath.item]
            self.strSlotName = strData.slotName
            print("self.strSlotName : \(self.strSlotName)")
            self.slot_id = strData.slotID
            currentSelected = indexPath.item
            CVSlots.reloadData()
      }else{
            print("Please select date first...")
            self.view.makeToast("Please select date first...")
        }
     }
}
