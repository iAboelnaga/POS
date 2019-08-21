//
//  KitchenCell.swift
//  Pos1
//
//  Created by Aboelnaga on 7/3/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit

class KitchenCell: UITableViewCell {
    
    @IBOutlet weak var orderTime: UILabel!
    @IBOutlet weak var caghierName: UILabel!
    @IBOutlet weak var items: UILabel!
    @IBOutlet weak var itemsDetails: UILabel!
    @IBOutlet weak var total: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func done(_ sender: Any)
    {
        //TODO
    }
    
}
