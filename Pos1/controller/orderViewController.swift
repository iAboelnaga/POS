//
//  orderViewController.swift
//  POS1
//
//  Created by Yehia iOS on 7/22/19.
//  Copyright © 2019 Yehia iOS. All rights reserved.
//

import UIKit

class orderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = UIColor.white
    }
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        return v
    }()
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(backButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func backButtonFunc() {
        let VC = scrollViewController()
        self.present(VC, animated: true, completion: nil)
    }
    lazy var saveButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("            Save", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(saveButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func saveButtonFunc() {
        var VC = OrdersVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
        self.present(VC, animated: false, completion: nil)
    }
    let rowImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group")
        return imageView
    }()
    lazy var KnetButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 87, green: 127, blue: 173)
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("Knet", for: .normal)
        button.addTarget(self, action: #selector(KnetButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func KnetButtonFunc() {
        //        let VC = scrollViewController()
        //        self.present(VC, animated: false, completion: nil)
    }
    lazy var CashButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 45, green: 194, blue: 220)
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("Cash", for: .normal)
        button.addTarget(self, action: #selector(CashButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func CashButtonFunc() {
        //        let VC = scrollViewController()
        //        self.present(VC, animated: false, completion: nil)
    }
    let TotalLabel : UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    let priceLabel : UILabel = {
        let label = UILabel()
        var num : Double = 0
        label.text = "$\(num)"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    let timeltitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    let timeLabel : UILabel = {
        let label = UILabel()
        var hours : Double = 0.00
        var minuits : Double = 0.00
        label.text = "\(hours):\(minuits)"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    let kindNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Grilled Beefsteak"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    let discNameLabel : UILabel = {
        let label = UILabel()
        label.text = "     Enjoy these grilled beefsteak sprinkledwith salt and pepper that."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    let orderLabel : UILabel = {
        let label = UILabel()
        label.text = "Order"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.layer.cornerRadius = 25
        label.layer.masksToBounds = true
        label.numberOfLines = 0
        label.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    let detailView = UIView()
    
    func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        view.addSubview(backButton)
        detailView.addSubview(orderLabel)
        detailView.addSubview(kindNameLabel)
        detailView.addSubview(discNameLabel)
        detailView.addSubview(TotalLabel)
        detailView.addSubview(priceLabel)
        detailView.addSubview(timeltitleLabel)
        detailView.addSubview(timeLabel)
        detailView.addSubview(KnetButton)
        detailView.addSubview(CashButton)
        detailView.addSubview(saveButton)
        detailView.addSubview(rowImageView)
        
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 20, height: 40)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        detailView.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 780)
        orderLabel.anchor(top: detailView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 65, paddingLeft: view.frame.width / 3, paddingBottom: 0, paddingRight: view.frame.width/3, width: 0, height: 50)
        kindNameLabel.anchor(top: orderLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 30)
        discNameLabel.anchor(top: kindNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 80)
        TotalLabel.anchor(top: discNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil
            , paddingTop: 80, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width/3, height: 40)
        priceLabel.anchor(top: discNameLabel.bottomAnchor, left: TotalLabel.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 80, paddingLeft: 0, paddingBottom:0 , paddingRight: 0, width: 0, height: 40)
        timeltitleLabel.anchor(top: TotalLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 80, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width/3, height: 40)
        timeLabel.anchor(top: TotalLabel.bottomAnchor, left: timeltitleLabel.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 80, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
         CashButton.anchor(top: timeltitleLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: view.frame.width/7, width: view.frame.width/3, height: view.frame.width/4)
        KnetButton.anchor(top: timeltitleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: view.frame.width/7, paddingBottom: 0, paddingRight: 0, width: view.frame.width/3, height: view.frame.width/4)
        saveButton.anchor(top: KnetButton.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: -20, width: view.frame.width / 2, height: 50)
        rowImageView.anchor(top: saveButton.topAnchor, left: nil, bottom: saveButton.bottomAnchor, right: saveButton.rightAnchor, paddingTop: 17, paddingLeft: 0, paddingBottom: 17, paddingRight: 35, width: 25, height: 0)
        
        
    }
    

}
