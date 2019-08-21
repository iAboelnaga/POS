//
//  DriversChatVC.swift
//  Pos1
//
//  Created by Aboelnaga on 7/23/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit

class DriversChatVC: UIViewController {

    @IBOutlet weak var driversCV: UICollectionView!
    @IBOutlet weak var chatsCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func backAction(_ sender: Any)
    {
        var VC = CategoriesVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
        self.present(VC, animated: false, completion: nil)
    }
    
}
extension DriversChatVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == driversCV
        {
            return 1
        }
        if collectionView == chatsCV
        {
            return 3
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == driversCV
        {
            return 5
        }
        if collectionView == chatsCV
        {
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : DriversCell!
        if collectionView == driversCV
        {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DriversCell", for: indexPath) as? DriversCell
            
            cell.contentView.layer.cornerRadius = 15.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.gray.cgColor
            cell.contentView.layer.masksToBounds = true
            
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            cell.layer.shadowOpacity = 0.5
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        }
        if collectionView == chatsCV
        {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatCell", for: indexPath) as? DriversCell
            
            cell.contentView.layer.cornerRadius = 8.0
            cell.contentView.layer.borderWidth = 2.0
            cell.contentView.layer.borderColor = UIColor(red: 251.0/255.0, green: 175.0/255.0, blue: 2.0/255.0, alpha: 1.0/1.0).cgColor
            cell.contentView.layer.masksToBounds = true
            
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            cell.layer.shadowOpacity = 0.5
            cell.layer.masksToBounds = false
            cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        }
        return cell
    }
}
