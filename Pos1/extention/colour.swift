//
//  colour.swift
//  POS1
//
//  Created by Yehia iOS on 7/18/19.
//  Copyright © 2019 Yehia iOS. All rights reserved.
//

import UIKit
extension UIColor{
    
    static func rgb(red: CGFloat,green: CGFloat, blue: CGFloat) ->UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}
