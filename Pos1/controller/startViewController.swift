//
//  startViewController.swift
//  POS1
//
//  Created by Yehia iOS on 7/18/19.
//  Copyright © 2019 Yehia iOS. All rights reserved.
//

import UIKit

class startViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setubView()
        view.backgroundColor = UIColor.white
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
    
    lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("            START", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(nextButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func nextButtonFunc() {
        let VC = jopViewController()
        self.present(VC, animated: false, completion: nil)
    }
    
    
    let rowImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group")
        return imageView
    }()
    
    func setubView()  {
        view.addSubview(backgroundImageview)
        view.addSubview(tiltleImageView)
        view.addSubview(nextButton)
        view.addSubview(rowImageView)
        backgroundImageview.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil
            , right: nil, paddingTop: 20, paddingLeft: -55, paddingBottom: 0, paddingRight: 0, width: view.frame.width  , height: view.frame.height / 2 - 70)
        tiltleImageView.anchor(top: backgroundImageview.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: -30, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: view.frame.width - (view.frame.width / 3), height: view.frame.height / 4 )
        nextButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 70, paddingRight: -20, width: view.frame.width / 2, height: 50)
        rowImageView.anchor(top: nextButton.topAnchor, left: nil, bottom: nextButton.bottomAnchor, right: nextButton.rightAnchor, paddingTop: 17, paddingLeft: 0, paddingBottom: 17, paddingRight: 35, width: 25, height: 0)
        
    }
}
