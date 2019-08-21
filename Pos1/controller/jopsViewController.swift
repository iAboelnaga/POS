//
//  jopsViewController.swift
//  POS1
//
//  Created by Yehia iOS on 7/18/19.
//  Copyright © 2019 Yehia iOS. All rights reserved.
//

import UIKit

class jopViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setubView()
        view.backgroundColor = UIColor.white
    }
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(backButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func backButtonFunc() {
        let VC = startViewController()
        self.present(VC, animated: true, completion: nil)
    }
    let backgroundImageview : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "—Pngtree—double burger image_1100651")
        return imageView
    }()
    
    let tiltleImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "Welcome to F o ode")
        return imageView
    }()
    
    lazy var driverButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.tintColor = .darkGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("            Driver", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(driverButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func driverButtonFunc() {
        let VC = signInViewController()
        self.present(VC, animated: false, completion: nil)
    }
    
    let rowImageViewDri : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group")
        return imageView
    }()
    lazy var kitchenButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.tintColor = .darkGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("         Kitchen", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(kitchenButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func kitchenButtonFunc() {
        let VC = signInViewController()
        self.present(VC, animated: false, completion: nil)
    }
    let rowImageViewKit : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group")
        return imageView
    }()
    lazy var cashierButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.tintColor = .darkGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("         Cashier", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(cashierButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func cashierButtonFunc() {
        let VC = signInViewController()
        self.present(VC, animated: false, completion: nil)
    }
    let rowImageViewCash : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group")
        return imageView
    }()
    lazy var mangerButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.tintColor = .darkGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("      Manager", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(mangerButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func mangerButtonFunc() {
        let VC = signInViewController()
        self.present(VC, animated: false, completion: nil)
    }
    let rowImageViewMang : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group")
        return imageView
    }()
    
    func setubView()  {
        view.addSubview(backButton)
        view.addSubview(backgroundImageview)
        view.addSubview(tiltleImageView)
        view.addSubview(driverButton)
        view.addSubview(rowImageViewDri)
        view.addSubview(kitchenButton)
        view.addSubview(rowImageViewKit)
        view.addSubview(cashierButton)
        view.addSubview(rowImageViewCash)
        view.addSubview(mangerButton)
        view.addSubview(rowImageViewMang)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 20, height: 40)
        backgroundImageview.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil
            , right: nil, paddingTop: 20, paddingLeft: -55, paddingBottom: 0, paddingRight: 0, width: view.frame.width  , height: view.frame.height / 2 - 70)
        tiltleImageView.anchor(top: backgroundImageview.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: -30, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width - (view.frame.width / 3), height: view.frame.height / 4 )
        driverButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 30, paddingRight: -20, width: view.frame.width / 2, height: 50)
        rowImageViewDri.anchor(top: driverButton.topAnchor, left: nil, bottom: driverButton.bottomAnchor, right: driverButton.rightAnchor, paddingTop: 17, paddingLeft: 0, paddingBottom: 17, paddingRight: 35, width: 25, height: 0)
        kitchenButton.anchor(top: nil, left: nil, bottom: driverButton.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 30, paddingRight: -20, width: view.frame.width/2, height: 50)
        rowImageViewKit.anchor(top: kitchenButton.topAnchor, left: nil, bottom: kitchenButton.bottomAnchor, right: kitchenButton.rightAnchor, paddingTop: 17, paddingLeft: 0, paddingBottom: 17, paddingRight: 35, width: 25, height: 0)
        cashierButton.anchor(top: nil, left: nil, bottom: kitchenButton.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom:30, paddingRight: -20, width: view.frame.width/2, height: 50)
        rowImageViewCash.anchor(top: cashierButton.topAnchor, left: nil, bottom: cashierButton.bottomAnchor, right: cashierButton.rightAnchor, paddingTop: 17, paddingLeft: 0, paddingBottom: 17, paddingRight: 35, width: 25, height: 0)
        mangerButton.anchor(top: nil, left: nil, bottom: cashierButton.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 30 , paddingRight: -20, width: view.frame.width/2, height: 50)
        rowImageViewMang.anchor(top: mangerButton.topAnchor, left: nil, bottom: mangerButton.bottomAnchor, right: mangerButton.rightAnchor, paddingTop: 17, paddingLeft: 0, paddingBottom: 17, paddingRight: 35, width: 25, height: 0)
    }
}
