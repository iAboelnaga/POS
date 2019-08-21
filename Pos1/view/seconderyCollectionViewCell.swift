//
//  seconderyCollectionViewCell.swift
//  POS1
//
//  Created by Yehia iOS on 7/18/19.
//  Copyright © 2019 Yehia iOS. All rights reserved.
//

import UIKit

class seconderyCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView()  {
        profileImageView.roundedImage()
        addSubview(viewOfCellScroll)
        addSubview(profileImageView)
        viewOfCellScroll.addSubview(productNameLabel)
        viewOfCellScroll.addSubview(contntLabel)
        viewOfCellScroll.addSubview(priceLabel)
        addSubview(selectedImageView)
        viewOfCellScroll.anchor(top: topAnchor, left: leftAnchor, bottom: selectedImageView.topAnchor, right: rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        profileImageView.anchor(top: topAnchor, left:centerXAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: -60 , paddingBottom: 0, paddingRight: 0, width: 120, height: 120)
        productNameLabel.anchor(top: profileImageView.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 2, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 30)
        contntLabel.anchor(top: productNameLabel.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 45)
        priceLabel.anchor(top: contntLabel.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 2, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 15)
        selectedImageView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: frame.width/2.5, paddingBottom: 0, paddingRight: frame.width/2.5, width: 0, height: 20)
        profileImageView.layer.cornerRadius = 60
        profileImageView.clipsToBounds = true
    }
    let viewOfCellScroll : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 0.5
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
        return imageView
    }()
    let productNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Chicken Rice"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
        
    }()
    let contntLabel : UILabel = {
        let label = UILabel()
        label.text = "1 rice & 1chicken"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
        
    }()
    let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "$20.00"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
        
    }()
    let selectedImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
}
