//
//  logOutViewController.swift
//  POS1
//
//  Created by Yehia iOS on 7/23/19.
//  Copyright © 2019 Yehia iOS. All rights reserved.
//

import UIKit

class logOutViewController: UIViewController {

    let token:Int = UserDefaults.standard.object(forKey: "userID") as! Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
    }
    let viewOfLogOut : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 40
        view.layer.masksToBounds = true
        return view
    }()
    let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "UI-avatar 2")
        imageView.layer.borderWidth = 0.5
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
        return imageView
    }()
    let profileNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Mohamed Ibrahim"
        label.backgroundColor = UIColor.clear
        label.textColor = .rgb(red: 69, green: 45, blue: 47)
        return label
    }()
    let jopNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Manger"
        label.backgroundColor = UIColor.clear
        label.textColor = .rgb(red: 69, green: 45, blue: 47)
        return label
    }()
    let xImageView : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.clear
        button.tintColor = .darkGray
        button.setImage(#imageLiteral(resourceName: "X"), for: .normal)
        button.addTarget(self, action: #selector(xFunc), for:.touchUpInside)
        return button
    }()
    @objc func xFunc (){
        //viewOfLogOut.isHidden =  true
        dismiss(animated: true, completion: nil)
    }
    let logOutIconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logout")
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    lazy var logoutTextButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.white
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitle("Log out", for: .normal)
        button.addTarget(self, action: #selector(LogOutFunc), for:.touchUpInside)
        return button
    }()
    @objc func LogOutFunc() {
        
        APIsRequests.logout(user_id: token) { (error:Error?, success:Bool) in
            if success{
                self.show(message: "logout successfully")
                let VC = jopViewController()
                self.present(VC, animated: true, completion: nil)
            }else{
                //self.show(message: "حاول مره أخرى")
            }
        }
    }
    func setupView()  {
        profileImageView.layer.cornerRadius = 60
        profileImageView.clipsToBounds = true
        view.addSubview(viewOfLogOut)
        viewOfLogOut.addSubview(profileImageView)
        viewOfLogOut.addSubview(profileNameLabel)
        viewOfLogOut.addSubview(jopNameLabel)
        viewOfLogOut.addSubview(xImageView)
        viewOfLogOut.addSubview(logoutTextButton)
        viewOfLogOut.addSubview(logOutIconImageView)
        viewOfLogOut.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 40, paddingRight: 20, width: 0, height: 300)
        xImageView.anchor(top: viewOfLogOut.topAnchor, left: nil, bottom: nil, right: viewOfLogOut.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 30, width: 20, height: 20)
        profileImageView.anchor(top: viewOfLogOut.topAnchor, left:viewOfLogOut.centerXAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: -60 , paddingBottom: 0, paddingRight: 0, width: 120, height: 120)
        profileNameLabel.anchor(top: profileImageView.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: -100, paddingBottom: 0, paddingRight: 0, width: 200, height: 30)
        jopNameLabel.anchor(top: profileNameLabel.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: -100, paddingBottom: 0, paddingRight: 0, width: 200, height: 30)
        logoutTextButton.anchor(top: nil, left: viewOfLogOut.leftAnchor, bottom: viewOfLogOut.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 30, paddingBottom: 15, paddingRight: 0, width: 90, height: 25)
        logOutIconImageView.anchor(top: nil, left: logoutTextButton.leftAnchor, bottom: logoutTextButton.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
    }
    func show(message: String) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 25;
        toastContainer.clipsToBounds  =  true
        
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        toastContainer.addSubview(toastLabel)
        self.view.addSubview(toastContainer)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([a1, a2, a3, a4])
        
        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 65)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -65)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -75)
        self.view.addConstraints([c1, c2, c3])
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}
