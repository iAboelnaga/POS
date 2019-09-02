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
    
    var obj : InOutTables?
    var obj2 : InOutTables?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indoorCV.register(UINib(nibName:"ProductsCell", bundle: .main), forCellWithReuseIdentifier: "ProductsCell")
        outdoorCV.register(UINib(nibName:"ProductsCell", bundle: .main), forCellWithReuseIdentifier: "ProductsCell")
        //handleRefresh()
        //handleRefresh2()
    }
    @IBAction func backButton(_ sender: Any)
    {
        var VC = OrdersVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
        self.present(VC, animated: false, completion: nil)
    }
    
    private func handleRefresh(){
        APIsRequests.inTables(casher_id: "47", type: "indoor") { (error:Error?, obj:InOutTables?) in
            if let obj = obj {
                self.obj = obj
                self.indoorCV.reloadData()
            }
        }
    }
    private func handleRefresh2(){
        APIsRequests.inTables(casher_id: "47", type: "outdoor") { (error:Error?, obj:InOutTables?) in
            if let obj = obj {
                self.obj2 = obj
                self.outdoorCV.reloadData()
            }
        }
    }
    
}
extension TablesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == indoorCV
        {
            //guard let  count = (obj?.data?.count) else{
            //    return 0        }
            return 3
        }
        if collectionView == outdoorCV
        {
            //guard let  count = (obj2?.data?.count) else{
            //    return 0        }
            return 4
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
