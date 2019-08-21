//
//  OrdersVC.swift
//  Pos1
//
//  Created by Aboelnaga on 6/30/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit

class OrdersVC: UIViewController {

    @IBOutlet weak var ordersCV: UICollectionView!
    @IBOutlet weak var rImg: UIImageView!
    
    var details = ["20 tables", "Pick up your food", "20 driver", "Invoice"]
    var names = ["Tables", "Take away", "Delivery", "Invoices"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ordersCV.register(UINib(nibName:"OrdersCell", bundle: .main), forCellWithReuseIdentifier: "OrdersCell")

    }
    @IBAction func backButton(_ sender: Any)
    {
        var VC = CategoriesVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
        self.present(VC, animated: false, completion: nil)
    }
    
}
extension OrdersVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrdersCell", for: indexPath) as! OrdersCell
        
        cell.labelN.text = names[indexPath.row]
        cell.labelD.text = details[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            var VC = TablesVC()
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            VC = storyBoard.instantiateViewController(withIdentifier: "TablesVC") as! TablesVC
            self.present(VC, animated: false, completion: nil)
        case 1:
            var VC = DeliveryVC()
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            VC = storyBoard.instantiateViewController(withIdentifier: "DeliveryVC") as! DeliveryVC
            self.present(VC, animated: false, completion: nil)
        case 2:
            var VC = DeliveryVC()
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            VC = storyBoard.instantiateViewController(withIdentifier: "DeliveryVC") as! DeliveryVC
            self.present(VC, animated: false, completion: nil)
            case 3:
                var VC = InvoicesVC()
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                VC = storyBoard.instantiateViewController(withIdentifier: "InvoicesVC") as! InvoicesVC
                self.present(VC, animated: false, completion: nil)
        default:
            print("ERORR")
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (ordersCV.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
}
