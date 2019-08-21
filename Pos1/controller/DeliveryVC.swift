//
//  DeliveryVC.swift
//  Pos1
//
//  Created by Aboelnaga on 7/24/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit

class DeliveryVC: UIViewController {

    @IBOutlet weak var driversCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        present(scrollViewController(), animated: true, completion: nil)
    }
}
extension DeliveryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DCell", for: indexPath) as! ChatCell
        
        return cell
}
}
