//
//  ViewController.swift
//  Pos1
//
//  Created by Aboelnaga on 6/27/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {
    
    var names = ["Orders", "Chat", "Kitchen", "Drivers"]
    var imgs:[UIImage] = [#imageLiteral(resourceName: "orders"), #imageLiteral(resourceName: "chat"), #imageLiteral(resourceName: "kitchen"), #imageLiteral(resourceName: "drivers")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var categoriesCV: UICollectionView!
    
    @IBAction func logout(_ sender: Any)
    {
        let VC = logOutViewController()
        self.present(VC, animated: false, completion: nil)
    }
    @IBAction func attendance(_ sender: Any)
    {
        var VC = AddNewEmpVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "AddNewEmpVC") as! AddNewEmpVC
        self.present(VC, animated: false, completion: nil)
    }
    @IBAction func logOut(_ sender: Any)
    {
        print("Logout")
    }
}
extension CategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CategoriesCell
        
        cell?.name.text = names[indexPath.row]
        cell?.img.image = imgs[indexPath.row]
        
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            var VC = OrdersVC()
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            VC = storyBoard.instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
            self.present(VC, animated: false, completion: nil)
        case 1:
            var VC = DriversChatVC()
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            VC = storyBoard.instantiateViewController(withIdentifier: "DriversChatVC") as! DriversChatVC
            self.present(VC, animated: false, completion: nil)
        case 2:
            var VC = KitchenVC()
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            VC = storyBoard.instantiateViewController(withIdentifier: "KitchenVC") as! KitchenVC
            self.present(VC, animated: false, completion: nil)
        /*case 3:
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let profile = storyBoard.instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
            self.navigationController?.pushViewController(profile, animated: true)*/
        default:
            print("ERORR")
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (categoriesCV.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }
}
