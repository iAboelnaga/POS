//
//  DeliveryVC.swift
//  Pos1
//
//  Created by Aboelnaga on 7/24/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit
import Kingfisher

class DeliveryVC: UIViewController {

    @IBOutlet weak var driversCV: UICollectionView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var area: UITextField!
    @IBOutlet weak var blockNum: UITextField!
    @IBOutlet weak var streetNum: UITextField!
    @IBOutlet weak var avenueNum: UITextField!
    @IBOutlet weak var buildingNum: UITextField!
    @IBOutlet weak var flatNum: UITextField!
    @IBOutlet weak var notes: UITextField!
    
    var payment_type : Int = 0
    var type_invoice : Int?
    var driver_id : String?
    var obj : Drivers?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefresh()
    }
    private func handleRefresh(){
        APIsRequests.drivers{ (error:Error?, obj:Drivers?) in
            if let obj = obj {
                self.obj = obj
                self.driversCV.reloadData()
            }
        }
    }
    @IBAction func backAction(_ sender: Any)
    {
        var VC = OrdersVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
        self.present(VC, animated: false, completion: nil)
    }
    @IBAction func next(_ sender: Any)
    {
        guard let fullName = name.text, !fullName.isEmpty else { return }
        guard let area = area.text, !area.isEmpty else { return }
        guard let mobile = mobile.text, !mobile.isEmpty else { return }
        guard let block = blockNum.text, !block.isEmpty else { return }
        guard let street = streetNum.text, !street.isEmpty else { return }
        guard let avenue = avenueNum.text, !avenue.isEmpty else { return }
        guard let building = buildingNum.text, !building.isEmpty else { return }
        guard let flat = flatNum.text, !flat.isEmpty else { return }
        guard let notes = notes.text, !notes.isEmpty else { return }
        
        APIsRequests.payment(user_id: "47", payment_type: payment_type, full_name: fullName, area: area, block: block, street: street, avenue: avenue, shipping_method: "", delivery: true, building: building, table_id: "3", type_invoice: type_invoice!, driver_id: driver_id!, flat: flat, notes: notes) { (error:Error?, success:Bool) in
            if success{
                self.show(message: "succcess")
                self.payment_type = 0
                self.present(scrollViewController(), animated: true, completion: nil)
            }else{
                self.show(message: "incorect data")
            }
        }
    }
    @IBAction func carriage(_ sender: Any)
    {
        
    }
    @IBAction func talabat(_ sender: Any)
    {
        
    }
    @IBAction func direct(_ sender: Any)
    {
        
    }
    @IBAction func cash(_ sender: Any)
    {
        if payment_type == 0 {
            payment_type = 2
        }
    }
    @IBAction func kent(_ sender: Any)
    {
        if payment_type == 0 {
            payment_type = 1
        }
    }
    func show(message: String) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 25;
        toastContainer.clipsToBounds  =  true
        
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        toastContainer.addSubview(toastLabel)
        self.view.addSubview(toastContainer)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([a1, a2, a3, a4])
        
        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 65)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -65)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -75)
        self.view.addConstraints([c1, c2, c3])
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}
extension DeliveryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let  count = (obj?.data?.count) else{
            return 0        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DCell", for: indexPath) as! ChatCell
        
        cell.img.layer.cornerRadius = 30
        cell.img.layer.masksToBounds = true
        
        cell.name.text = obj?.data?[indexPath.row].username ?? "Driver"
        
        let imageString = (obj?.data?[indexPath.row].img)!
        let imagesUrl = URL(string: imageString)!
        cell.img?.kf.setImage(with: imagesUrl)
        
        return cell
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        driver_id = obj?.data?[indexPath.row].driverId
        print(driver_id)
    }
}
