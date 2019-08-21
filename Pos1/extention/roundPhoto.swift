//
//  roundPhoto.swift
//  POS1
//
//  Created by Yehia iOS on 7/20/19.
//  Copyright © 2019 Yehia iOS. All rights reserved.
//

import UIKit
extension UIImageView{
    func roundedImage()  {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
