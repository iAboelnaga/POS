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
    var dep_id : Int?
    let reuseIdentifier = "cellId"
    let cellId = "cellId"
    let o : swappingCollectionViewCell? = nil
    
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
                self.sectionsCollectionView.reloadData()
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
    }
    let swappingCollectionView : UICollectionView = {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.isScrollEnabled = false
        collectionView.isPagingEnabled = true
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    let sectionsCollectionView : UICollectionView = {
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let viewOfCollection = UIView()
    let detailView = UIView()
    
    @objc func nextButtonFunc()  {
        present(orderViewController(), animated: true, completion: nil)
    }
    func setupView (){
        self.swappingCollectionView.register(swappingCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        swappingCollectionView.delegate = self
        swappingCollectionView.dataSource = self
        self.sectionsCollectionView.register(SectionsCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        detailView.addSubview(backButton)
        view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        scrollView.addSubview(viewOfCollection)
        detailView.addSubview(sectionsCollectionView)
        viewOfCollection.addSubview(swappingCollectionView)
        backButton.anchor(top: detailView.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: -5, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 20, height: 40)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -40, paddingRight: 0, width: 0, height: 0)
        detailView.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 80, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        sectionsCollectionView.anchor(top: detailView.topAnchor, left: detailView.leftAnchor, bottom: detailView.bottomAnchor, right: detailView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        viewOfCollection.anchor(top: detailView.bottomAnchor, left: view.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1430)
        swappingCollectionView.anchor(top: viewOfCollection.topAnchor, left: viewOfCollection.leftAnchor, bottom: viewOfCollection.bottomAnchor, right: viewOfCollection.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == swappingCollectionView{
            return 3
        }
        else  if collectionView == sectionsCollectionView{
            guard let  count = (obj?.data?.count) else{
                return 0        }
            return count
        }
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = swappingCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! swappingCollectionViewCell
        let sectionsCell = sectionsCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SectionsCollectionViewCell
        cell.nextButton.tag = indexPath.row
        cell.nextButton.addTarget(self, action: #selector(nextButtonFunc), for:.touchUpInside)

        if collectionView == swappingCollectionView {

            return cell
        }
        else if collectionView == sectionsCollectionView {
            
            sectionsCell.catName.text = obj?.data?[indexPath.row].name
            let def = UserDefaults.standard
            def.setValue(table_id, forKey: "table_id")
            def.synchronize()
        
            return sectionsCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == swappingCollectionView {
            return 0
        }
        else if collectionView == sectionsCollectionView {
            return 10
        }
        return 0
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == swappingCollectionView {
            return 0
        }
        else if collectionView == sectionsCollectionView {
            return 10
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == swappingCollectionView {
            return CGSize(width: collectionView.frame.width  , height: collectionView.frame.height )
        }
        else if collectionView == sectionsCollectionView {
            return CGSize(width: collectionView.frame.width / 3.2 , height: collectionView.frame.height)
        }
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == swappingCollectionView {
            
        }
        else if collectionView == sectionsCollectionView {
            if indexPath.row == 0 {
                print("1")
                let def = UserDefaults.standard
                def.setValue(obj?.data?[indexPath.row].id, forKey: "dep_id")
                def.synchronize()
                NotificationCenter.default.post(name: NSNotification.Name("load"), object: nil)
            }
            else if indexPath.row == 1{
                print("2")
                let def = UserDefaults.standard
                def.setValue(obj?.data?[indexPath.row].id, forKey: "dep_id")
                def.synchronize()
                NotificationCenter.default.post(name: NSNotification.Name("load"), object: nil)
            }
            else if indexPath.row == 2{
                print("3")
                let def = UserDefaults.standard
                def.setValue(obj?.data?[indexPath.row].id, forKey: "dep_id")
                def.synchronize()
                NotificationCenter.default.post(name: NSNotification.Name("load"), object: nil)
            }
            else if indexPath.row == 3{
                print("4")
                let def = UserDefaults.standard
                def.setValue(obj?.data?[indexPath.row].id, forKey: "dep_id")
                def.synchronize()
                NotificationCenter.default.post(name: NSNotification.Name("load"), object: nil)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top:0 ,left: 0, bottom: 0, right: 0)
    }
}
