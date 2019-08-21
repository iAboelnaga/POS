//
//  TablesVC.swift
//  Pos1
//
//  Created by Aboelnaga on 7/1/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit

class TablesVC: UIViewController {

    @IBOutlet weak var rImg: UIImageView!
    @IBOutlet weak var indoorCV: UICollectionView!
    @IBOutlet weak var outdoorCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indoorCV.register(UINib(nibName:"ProductsCell", bundle: .main), forCellWithReuseIdentifier: "ProductsCell")
        outdoorCV.register(UINib(nibName:"ProductsCell", bundle: .main), forCellWithReuseIdentifier: "ProductsCell")
        
    }
    @IBAction func backButton(_ sender: Any)
    {
        var VC = OrdersVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
        self.present(VC, animated: false, completion: nil)
    }
    
}
extension TablesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == indoorCV
        {
            return 3
        }
        if collectionView == outdoorCV
        {
            return 3
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : ProductsCell!
        if collectionView == indoorCV
        {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCell", for: indexPath) as? ProductsCell
        }
        if collectionView == outdoorCV
        {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCell", for: indexPath) as? ProductsCell
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == indoorCV
        {
        switch indexPath.row {
        case 0:
            let VC = scrollViewController()
            self.present(VC, animated: false, completion: nil)
        case 1:
            let VC = scrollViewController()
            self.present(VC, animated: false, completion: nil)
        case 2:
            let VC = scrollViewController()
            self.present(VC, animated: false, completion: nil)
        default:
            print("ERORR")
        }
        }
        if collectionView == outdoorCV
        {
            switch indexPath.row {
            case 0:
                let VC = scrollViewController()
                self.present(VC, animated: false, completion: nil)
            case 1:
                let VC = scrollViewController()
                self.present(VC, animated: false, completion: nil)
            default:
                print("ERORR")
            }
        }
    }
}
