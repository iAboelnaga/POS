//
//  scrollViewController.swift
//  POS1
//
//  Created by Yehia iOS on 7/18/19.
//  Copyright © 2019 Yehia iOS. All rights reserved.
//

import UIKit

class scrollViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var obj : MainCategories?
    var pro : Products?
    var i = 0
    var table_id : String?
    let reuseIdentifier = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        handleRefresh()
        print(i)
        view.backgroundColor = .rgb(red: 251, green: 175, blue: 2)
    }
    private func handleRefresh(){
        APIsRequests.categories(user_id: "47") { (error:Error?, obj:MainCategories?) in
            if let obj = obj {
                self.obj = obj
                self.BurgerButton.setTitle(obj.data?[0].name, for: .normal)
                self.saladButton.setTitle(obj.data?[1].name, for: .normal)
                self.fruitsButton.setTitle(obj.data?[2].name, for: .normal)
            }
        }
    }
    private func handleRefresh2(dep_id: Int){
        APIsRequests.products(dep_id: dep_id, user_id: "47") { (error:Error?, pro:Products?) in
            if let pro = pro {
                self.pro = pro
            }
        }
    }
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .rgb(red: 251, green: 175, blue: 2)
        return v
    }()
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "backRowScroll"), for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(backButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func backButtonFunc() {
        dismiss(animated: true, completion: nil)
        /*var VC = OrdersVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
        self.present(VC, animated: false, completion: nil)*/
    }
    lazy var BurgerButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.rgb(red: 8, green: 0, blue: 64)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .darkGray
        button.setTitle(obj?.data?[0].name, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(BurgerButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func BurgerButtonFunc() {
        let indexPath = IndexPath(item: 0, section: 0)
        i = 0
        self.handleRefresh2(dep_id: 0)
        self.swappingCollectionView.reloadData()
        self.swappingCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        BurgerButton.backgroundColor = UIColor.rgb(red: 8, green: 0, blue: 64)
        BurgerButton.setTitleColor(UIColor.white, for: .normal)
        saladButton.backgroundColor = UIColor.clear
        fruitsButton.backgroundColor = UIColor.clear
        fruitsButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        saladButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
    }
    lazy var saladButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
//        button.backgroundColor = UIColor.rgb(red: 8, green: 0, blue: 64)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .darkGray
        button.setTitle(obj?.data?[1].name, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(saladButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func saladButtonFunc() {
        let indexPath = IndexPath(item: 1, section: 0)
        i = 1
        self.handleRefresh2(dep_id: 1)
        self.swappingCollectionView.reloadData()
        self.swappingCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        saladButton.backgroundColor = UIColor.rgb(red: 8, green: 0, blue: 64)
        saladButton.setTitleColor(UIColor.white, for: .normal)
        BurgerButton.backgroundColor = UIColor.clear
        fruitsButton.backgroundColor = UIColor.clear
        BurgerButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        fruitsButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        print(i)
    }
    lazy var fruitsButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.cgColor
        button.tintColor = .darkGray
        button.setTitle(obj?.data?[2].name, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(fruitsButtonFunc), for:.touchUpInside)
        return button
    }()
    @objc func fruitsButtonFunc() {
        let indexPath = IndexPath(item: 2, section: 0)
        i = 2
        self.handleRefresh2(dep_id: 2)
        self.swappingCollectionView.reloadData()
        self.swappingCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        fruitsButton.backgroundColor = UIColor.rgb(red: 8, green: 0, blue: 64)
        fruitsButton.setTitleColor(UIColor.white, for: .normal)
        BurgerButton.backgroundColor = UIColor.clear
        saladButton.backgroundColor = UIColor.clear
        BurgerButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
        saladButton.setTitleColor(UIColor.rgb(red: 8, green: 0, blue: 64), for: .normal)
    }
    let swappingCollectionView : UICollectionView = {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectioView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectioView.isScrollEnabled = false
        collectioView.isPagingEnabled = true
        collectioView.backgroundColor = UIColor.rgb(red: 251, green: 175, blue: 2)
        collectionViewLayout.scrollDirection = .horizontal
        collectioView.backgroundColor = .clear
        collectioView.translatesAutoresizingMaskIntoConstraints = false
        return collectioView
    }()
    
    let viewOfCollection = UIView()
    let detailView = UIView()
    
    @objc func nextButtonFunc()  {
        present(orderViewController(), animated: true, completion: nil)
    }
    func setupView (){
        //self.handleRefresh()
    self.swappingCollectionView.register(swappingCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        swappingCollectionView.delegate = self
        swappingCollectionView.dataSource = self
        detailView.addSubview(backButton)
        view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        scrollView.addSubview(viewOfCollection)
        detailView.addSubview(BurgerButton)
        detailView.addSubview(saladButton)
        detailView.addSubview(fruitsButton)
        viewOfCollection.addSubview(swappingCollectionView)
        backButton.anchor(top: detailView.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 20, height: 40)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -40, paddingRight: 0, width: 0, height: 0)
        detailView.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 180)
        BurgerButton.anchor(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: view.frame.width/3 - 10, height: 48)
        fruitsButton.anchor(top: detailView.topAnchor, left: nil, bottom: nil, right: detailView.rightAnchor, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: view.frame.width/3 - 10, height: 48)
        saladButton.anchor(top: detailView.topAnchor, left: BurgerButton.rightAnchor, bottom: nil, right: fruitsButton.leftAnchor, paddingTop: 100, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 48)
        viewOfCollection.anchor(top: detailView.bottomAnchor, left: view.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1430)
        swappingCollectionView.anchor(top: viewOfCollection.topAnchor, left: viewOfCollection.leftAnchor, bottom: viewOfCollection.bottomAnchor, right: viewOfCollection.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = swappingCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! swappingCollectionViewCell
        cell.nextButton.tag = indexPath.row
        cell.nextButton.addTarget(self, action: #selector(nextButtonFunc), for:.touchUpInside)
        //cell.foodCollectionView.numberOfItems(inSection: 3)
        //cell.foodCollectionView.reloadData()
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width  , height: collectionView.frame.height )
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:0 ,left: 0, bottom: 0, right: 0)
    }
}

