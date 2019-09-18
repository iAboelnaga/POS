//
//  swappingCollectionViewCell.swift
//  POS1
//
//  Created by Yehia iOS on 7/18/19.
//  Copyright © 2019 Yehia iOS. All rights reserved.
//

import UIKit

class swappingCollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var pro : Products?
    var size_id:Int = 8
    var pro_id : Int?
    
    let cellId = "cellId"
    let reuseCell = "cell"
    
    var delegate: CustomCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        scrollViewView()
        handleRefresh2(dep_id: 1)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let foodCollectionView : UICollectionView = {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectioView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectioView.backgroundColor = UIColor.clear
        collectionViewLayout.scrollDirection = .horizontal
        collectioView.translatesAutoresizingMaskIntoConstraints = false
        return collectioView
    }()
    let viewOfCellScroll : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 18
        view.layer.masksToBounds = true
        return view
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
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    let sizeTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Choose Size"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    let chooseAmountLabel : UILabel = {
        let label = UILabel()
        label.text = "Choose Amount"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    let extraToppingLabel : UILabel = {
        let label = UILabel()
        label.text = "Extra Topping"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    let chooseSauceLabel : UILabel = {
        let label = UILabel()
        label.text = "Choose Sauce"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.rgb(red: 216, green: 216, blue: 216)
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    lazy var smallButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .darkGray
        button.setTitle("Small", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(smallButtonFunc), for:.touchUpInside)
        return button
    }()
    private func handleRefresh2(dep_id: Int){
        APIsRequests.products(dep_id: dep_id, user_id: "47") { (error:Error?, pro:Products?) in
            if let pro = pro {
                self.pro = pro
                self.foodCollectionView.reloadData()
            }
        }
    }
    @objc func loadList(notification: NSNotification) {
        var depId:Int? = UserDefaults.standard.object(forKey: "dep_id") as! Int
        print("dep_id = \((depId) ?? 1)")
        handleRefresh2(dep_id: depId ?? 1)
    }
    @objc func smallButtonFunc() {
        smallButton.backgroundColor = UIColor.rgb(red: 8, green: 0, blue: 64)
        smallButton.setTitleColor(UIColor.white, for: .normal)
        meduimButton.backgroundColor = UIColor.clear
        largeButton.backgroundColor = UIColor.clear
        meduimButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        largeButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        self.size_id = 7
    }
    lazy var meduimButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.rgb(red: 8, green: 0, blue: 64)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .darkGray
        button.setTitle("Medium", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(meduimButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func meduimButtonFunc() {
        meduimButton.backgroundColor = UIColor.rgb(red: 8, green: 0, blue: 64)
        meduimButton.setTitleColor(UIColor.white, for: .normal)
        smallButton.backgroundColor = UIColor.clear
        largeButton.backgroundColor = UIColor.clear
        smallButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        largeButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        self.size_id = 8
    }
    lazy var largeButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .darkGray
        button.setTitle("Large", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(largeButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func largeButtonFunc() {
        largeButton.backgroundColor = UIColor.rgb(red: 8, green: 0, blue: 64)
        largeButton.setTitleColor(UIColor.white, for: .normal)
        smallButton.backgroundColor = UIColor.clear
        meduimButton.backgroundColor = UIColor.clear
        smallButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        meduimButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        self.size_id = 9
    }
    lazy var plusButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "plusAdd"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        button.backgroundColor = UIColor.white
        button.tintColor = .rgb(red: 8, green: 0, blue: 64)
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(plusButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func plusButtonFunc() {
        resultLblForItems.text = "\(Int(resultLblForItems.text!)! + 1)"

    }
    lazy var minusButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Add"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        button.backgroundColor = UIColor.white
        button.tintColor = .rgb(red: 8, green: 0, blue: 64)
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(minusButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func minusButtonFunc() {
        let result = Int(resultLblForItems.text!)!
        if result > 0  {
            resultLblForItems.text = "\(Int(resultLblForItems.text!)! - 1)"
        }
        
    }
    let resultLblForItems: UILabel = {
        let label = UILabel()
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        label.font = UIFont.systemFont(ofSize: 22.0)
        label.backgroundColor = UIColor.clear
        var num : Int = 0
        label.text = "\(num)"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
   
    lazy var cheeseButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.white
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        button.setTitle("   Cheese", for: .normal)
        button.addTarget(self, action: #selector(cheeseButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func cheeseButtonFunc() {
            selectedcheeseImageView.image = #imageLiteral(resourceName: "Path-Copy")
            cheeseButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    lazy var strawberryButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.white
        button.tintColor = .darkGray
        button.setTitle("   Strawberry", for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        button.addTarget(self, action: #selector(strawberryButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func strawberryButtonFunc() {
        selectedstrawImageView.image = #imageLiteral(resourceName: "Path-Copy")
        strawberryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            }
    lazy var CherryButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.white
        button.tintColor = .darkGray
        button.setTitle("   Cherry", for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        button.addTarget(self, action: #selector(CherryButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func CherryButtonFunc() {
        selectedcherryImageView.image = #imageLiteral(resourceName: "Path-Copy")
        CherryButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    lazy var BeefButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.white
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        button.setTitle("   Beef", for: .normal)
        button.addTarget(self, action: #selector(BeefButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func BeefButtonFunc() {
        selectedbeefImageView.image = #imageLiteral(resourceName: "Path-Copy")
        BeefButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    lazy var sweetSauceButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.white
        button.tintColor = .darkGray
        button.setTitle("   Sweet Sauce", for: .normal)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        button.addTarget(self, action: #selector(sweetSauceButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func sweetSauceButtonFunc() {
        selectedsweetImageView.image = #imageLiteral(resourceName: "Path-Copy")
        sweetSauceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    lazy var hotSauceButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.white
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        button.setTitle("   Hot Sauce", for: .normal)
        button.addTarget(self, action: #selector(hotSauceButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func hotSauceButtonFunc() {
        selectedhotImageView.image = #imageLiteral(resourceName: "Path-Copy")
        hotSauceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    lazy var salsaSauceButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.white
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        button.setTitle("   Salsa Sauce", for: .normal)
        button.addTarget(self, action: #selector(salsaButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func salsaButtonFunc() {
        selectedslsaImageView.image = #imageLiteral(resourceName: "Path-Copy")
        salsaSauceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        button.tintColor = .darkGray
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("            Next", for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(nextButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func nextButtonFunc() {
        delegate?.sharePressed(cell: self)
        guard let quantity = resultLblForItems.text, resultLblForItems.text != "0" else {
            show(message: "Please choose quantity")
            return }
        guard let proId = pro_id, pro_id != 0 else {
            show(message: "Please Choose Product")
            return }
        var tableId:String? = UserDefaults.standard.object(forKey: "table_id") as! String
        APIsRequests.addBasket(casher_id: "47", pro_id: proId, quantity: quantity, size_id: size_id, table_id: tableId ?? "1") { (error:Error?, success:Bool) in
            if success {
                print(tableId)
                self.show(message: "ADD successfully")
            }
            else {
                self.show(message: "Faild")
            }
        }
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
        viewOfCellScroll.addSubview(toastContainer)
        //self.view.addSubview(toastContainer)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([a1, a2, a3, a4])
        
        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: self.viewOfCellScroll, attribute: .leading, multiplier: 1, constant: 65)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: self.viewOfCellScroll, attribute: .trailing, multiplier: 1, constant: -65)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: self.viewOfCellScroll, attribute: .bottom, multiplier: 1, constant: -75)
        self.viewOfCellScroll.addConstraints([c1, c2, c3])
        
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
    let priceItemLabel : UILabel = {
        let label = UILabel()
        label.text = "$30.00"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .rgb(red: 8, green: 0, blue: 64)
        return label
    }()
    let selectedcheeseImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let selectedstrawImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let selectedbeefImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let selectedcherryImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let selectedsweetImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let selectedhotImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let selectedslsaImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    func scrollViewView(){
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        foodCollectionView.register(seconderyCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(foodCollectionView)
        addSubview(viewOfCellScroll)
        viewOfCellScroll.addSubview(kindNameLabel)
        viewOfCellScroll.addSubview(discNameLabel)
        viewOfCellScroll.addSubview(sizeTitleLabel)
        viewOfCellScroll.addSubview(smallButton)
        viewOfCellScroll.addSubview(meduimButton)
        viewOfCellScroll.addSubview(largeButton)
        viewOfCellScroll.addSubview(chooseAmountLabel)
        viewOfCellScroll.addSubview(plusButton)
        viewOfCellScroll.addSubview(resultLblForItems)
        viewOfCellScroll.addSubview(minusButton)
        viewOfCellScroll.addSubview(extraToppingLabel)
        viewOfCellScroll.addSubview(cheeseButton)
        cheeseButton.addSubview(selectedcheeseImageView)
        viewOfCellScroll.addSubview(strawberryButton)
        strawberryButton.addSubview(selectedstrawImageView)
        viewOfCellScroll.addSubview(CherryButton)
        CherryButton.addSubview(selectedcherryImageView)
        viewOfCellScroll.addSubview(BeefButton)
        BeefButton.addSubview(selectedbeefImageView)
        viewOfCellScroll.addSubview(chooseSauceLabel)
        viewOfCellScroll.addSubview(sweetSauceButton)
        sweetSauceButton.addSubview(selectedsweetImageView)
        viewOfCellScroll.addSubview(hotSauceButton)
        hotSauceButton.addSubview(selectedhotImageView)
        viewOfCellScroll.addSubview(salsaSauceButton)
        salsaSauceButton.addSubview(selectedslsaImageView)
        viewOfCellScroll.addSubview(nextButton)
        viewOfCellScroll.addSubview(priceItemLabel)
        
        foodCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 250)
        viewOfCellScroll.anchor(top: foodCollectionView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        kindNameLabel.anchor(top: viewOfCellScroll.topAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 30)
        discNameLabel.anchor(top: kindNameLabel.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 10, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 70)
        sizeTitleLabel.anchor(top: discNameLabel.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        smallButton.anchor(top: sizeTitleLabel.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.width/3 - 20, height: 48)
        largeButton.anchor(top: sizeTitleLabel.bottomAnchor, left: nil, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: frame.width/3 - 20, height: 48)
        meduimButton.anchor(top: sizeTitleLabel.bottomAnchor, left: smallButton.rightAnchor, bottom: nil, right: largeButton.leftAnchor, paddingTop: 30, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 48)
        chooseAmountLabel.anchor(top: meduimButton.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        minusButton.anchor(top: chooseAmountLabel.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: frame.width / 4, paddingBottom: 0, paddingRight: 0, width: 50, height: 80)
        resultLblForItems.anchor(top: chooseAmountLabel.bottomAnchor, left: minusButton.rightAnchor, bottom: nil, right: plusButton.leftAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        plusButton.anchor(top: chooseAmountLabel.bottomAnchor, left: nil, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: frame.width / 4, width: 50, height: 80)
        extraToppingLabel.anchor(top: plusButton.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        cheeseButton.anchor(top: extraToppingLabel.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        selectedcheeseImageView.anchor(top: cheeseButton.topAnchor, left: nil, bottom: cheeseButton.bottomAnchor, right: cheeseButton.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 30, height: 0)
        strawberryButton.anchor(top: cheeseButton.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        selectedstrawImageView.anchor(top: strawberryButton.topAnchor, left: nil, bottom: strawberryButton.bottomAnchor, right: strawberryButton.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 30, height: 0)
        CherryButton.anchor(top: strawberryButton.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        selectedcherryImageView.anchor(top: CherryButton.topAnchor, left: nil, bottom: CherryButton.bottomAnchor, right: CherryButton.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 30, height: 0)
        BeefButton.anchor(top: CherryButton.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        selectedbeefImageView.anchor(top: BeefButton.topAnchor, left: nil, bottom: BeefButton.bottomAnchor, right: BeefButton.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 30, height: 0)
         chooseSauceLabel.anchor(top: BeefButton.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        sweetSauceButton.anchor(top: chooseSauceLabel.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        selectedsweetImageView.anchor(top: sweetSauceButton.topAnchor, left: nil, bottom: sweetSauceButton.bottomAnchor, right: sweetSauceButton.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 30, height: 0)
        hotSauceButton.anchor(top: sweetSauceButton.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        selectedhotImageView.anchor(top: hotSauceButton.topAnchor, left: nil, bottom: hotSauceButton.bottomAnchor, right: hotSauceButton.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 30, height: 0)
        salsaSauceButton.anchor(top: hotSauceButton.bottomAnchor, left: viewOfCellScroll.leftAnchor, bottom: nil, right: viewOfCellScroll.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        selectedslsaImageView.anchor(top: salsaSauceButton.topAnchor, left: nil, bottom: salsaSauceButton.bottomAnchor, right: salsaSauceButton.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 30, height: 0)
         nextButton.anchor(top: nil, left: nil, bottom: viewOfCellScroll.bottomAnchor, right: viewOfCellScroll.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 70, paddingRight: -20, width: frame.width / 2, height: 50)
        priceItemLabel.anchor(top: nil, left: viewOfCellScroll.leftAnchor, bottom: viewOfCellScroll.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 70, paddingRight: 0, width: frame.width/2.5, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let  count = (pro?.data?.count) else { return 0 }
        return count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! seconderyCollectionViewCell
        cell.productNameLabel.text = pro?.data?[indexPath.row].name
        cell.contntLabel.text = pro?.data?[indexPath.row].branchName
        cell.priceLabel.text = "\((pro?.data?[indexPath.row].price)!)"
        
        let imageString = (pro?.data?[indexPath.row].mainImg) ?? "http://mrcashier.net/images/products/15627514392.png"
        let imagesUrl = URL(string: imageString)
        cell.profileImageView.kf.setImage(with: imagesUrl)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? seconderyCollectionViewCell
        if cell?.isSelected == true {
            cell?.selectedImageView.image = #imageLiteral(resourceName: "selected")
//            cell?.isSelected = false
        }
        else {
            cell?.selectedImageView.image = nil
        }
        pro_id = pro?.data?[indexPath.row].iD
    }
    
}

protocol CustomCellDelegate: class {
    func sharePressed(cell: swappingCollectionViewCell)
}
