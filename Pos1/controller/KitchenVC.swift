//
//  KitchenVC.swift
//  Pos1
//
//  Created by Aboelnaga on 7/3/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit

class KitchenVC: UIViewController {

    @IBOutlet weak var kitchenTV: UITableView!
    
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
extension KitchenVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "KitchenCell", for: indexPath) as! KitchenCell
        
        cell.layer.cornerRadius = 8
        /*
        //cell.layer.shadowPath =
        cell.layer.shadowOffset = CGSize(width: 13, height: 13)
        cell.layer.shadowRadius = 16
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        */
        return cell
    }
    
}
