
//
//  sectionsCollectionViewCell.swift
//  Pos1
//
//  Created by Yehia iOS on 9/1/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    var delegate: sectionCellDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let catName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.backgroundColor = UIColor.rgb(red: 8, green: 0, blue: 64)
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.white.cgColor
        label.tintColor = .darkGray
        label.layer.cornerRadius = 25
        label.layer.masksToBounds = true
        label.text = ""
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    func setupView(){
        addSubview(catName)
        catName.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 48)
    }
}
protocol sectionCellDelegate: class {
    func sharePressed(cell: SectionsCollectionViewCell)
}
