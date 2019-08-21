//
//  InvoicesVC.swift
//  Pos1
//
//  Created by Aboelnaga on 6/30/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit

class InvoicesVC: UIViewController {

    @IBOutlet weak var takeAwayCV: UICollectionView!
    @IBOutlet weak var tableCV: UICollectionView!
    @IBOutlet weak var deliveryCV: UICollectionView!
    
    
    @IBOutlet weak var takeAwayTotal: UILabel!
    @IBOutlet weak var tableTotal: UILabel!
    @IBOutlet weak var deliveryTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func totalAction(_ sender: Any)
    {
        //TODO
    }
    @IBAction func backAction(_ sender: Any)
    {
        var VC = OrdersVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
        self.present(VC, animated: false, completion: nil)
    }
}
extension InvoicesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell : InvoicesCell!
        
        if collectionView == takeAwayCV {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as? InvoicesCell
            
            cell.contentView.layer.cornerRadius = 8.0
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
        if collectionView == tableCV {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as? InvoicesCell
            
            cell.contentView.layer.cornerRadius = 8.0
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
        if collectionView == deliveryCV {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell3", for: indexPath) as? InvoicesCell
            
            cell.contentView.layer.cornerRadius = 8.0
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
        return cell
    }
}
