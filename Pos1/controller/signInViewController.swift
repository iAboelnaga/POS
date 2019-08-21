//
//  signInViewController.swift
//  POS1
//
//  Created by Yehia iOS on 7/18/19.
//  Copyright © 2019 Yehia iOS. All rights reserved.
//

import UIKit

class signInViewController: UIViewController {

    var obj : Login?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupView()
    }
    private func handleRefresh(){
        APIsRequests.login(username: "ali", user_pass: "1") { (error:Error?, obj:Login?) in
            if let obj = obj {
                self.obj = obj
            }
        }
    }
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(backButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func backButtonFunc() {
        let VC = jopViewController()
        self.present(VC, animated: true, completion: nil)
    }
    let signInImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "signIn")
        return imageView
    }()
    let userNameLabel : UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        return label
        
    }()
    let usernameTextView :UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.masksToBounds = false
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 1.0
        textField.layer.shadowRadius = 0.0
        return textField
    }()
    let passwordLabel : UILabel = {
        let label = UILabel()
        label.text = "Code"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        return label
        
    }()
    let passwordTextView :UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.borderStyle = .none
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.masksToBounds = false
        textField.layer.shadowColor = UIColor.gray.cgColor
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        textField.layer.shadowOpacity = 1.0
        textField.layer.shadowRadius = 0.0

        return textField
    }()
    let forgetPasswordbutton : UIButton = {
        let button  = UIButton()
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.backgroundColor = UIColor.clear
        button.tintColor = .lightGray
        button.setTitle("Forget Your Password?", for: .normal)
        button.addTarget(self, action: #selector(forgetButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func forgetButtonFunc() {
//        let VC = jopViewController()
//        self.present(VC, animated: false, completion: nil)
    }
    lazy var signInButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("         SIGN IN", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(SignINButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func SignINButtonFunc() {
        
        guard let userName = usernameTextView.text, !userName.isEmpty else { return }
        guard let password = passwordTextView.text, !password.isEmpty else { return }
        
        APIsRequests.login(username: userName, user_pass: password) { (error:Error?, obj:Login?) in
            if let obj = obj {
                self.obj = obj
                if obj.status == true {
                    self.show(message: obj.message!)
                    var VC = CategoriesVC()
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    VC = storyBoard.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
                    self.present(VC, animated: false, completion: nil)
                }
                else {
                    self.show(message: obj.message!)
                    }
                }
        }
    }
    let rowImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Group")
        return imageView
    }()
    lazy var unseenButton : UIButton = {
        let button = UIButton()
        button.tintColor = .darkGray
        button.setImage(#imageLiteral(resourceName: "unseen"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets.init(top: 40, left: 40, bottom: 40, right: 40)
        button.addTarget(self, action: #selector(unseenButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func unseenButtonFunc() {
        if passwordTextView.isSecureTextEntry == true {
        passwordTextView.isSecureTextEntry = false
        }
        else {
            passwordTextView.isSecureTextEntry = true
        }
    }
    
    func setupView() {
        view.addSubview(backButton)
        view.addSubview(signInImageView)
        view.addSubview(userNameLabel)
        view.addSubview(usernameTextView)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextView)
        view.addSubview(unseenButton)
        view.addSubview(forgetPasswordbutton)
        view.addSubview(signInButton)
        view.addSubview(rowImageView)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 20, height: 40)
        signInImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: view.frame.height/6, paddingLeft: 7, paddingBottom: 0, paddingRight: 0, width: 155, height: 55)
        userNameLabel.anchor(top: signInImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 30 , paddingLeft: 30, paddingBottom: 0, paddingRight:0 , width: 130, height: 40)
        usernameTextView.anchor(top: userNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 55)
        passwordLabel.anchor(top: usernameTextView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight:0 , width: 130, height: 40)
        passwordTextView.anchor(top: passwordLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 55)
        unseenButton.anchor(top: passwordTextView.topAnchor, left: nil, bottom: passwordTextView.bottomAnchor, right: passwordTextView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 40, height: 0)
        forgetPasswordbutton.anchor(top: passwordTextView.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
        signInButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 70, paddingRight: -20, width: view.frame.width / 2, height: 50)
        rowImageView.anchor(top: signInButton.topAnchor, left: nil, bottom: signInButton.bottomAnchor, right: signInButton.rightAnchor, paddingTop: 17, paddingLeft: 0, paddingBottom: 17, paddingRight: 35, width: 25, height: 0)
        
        
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
