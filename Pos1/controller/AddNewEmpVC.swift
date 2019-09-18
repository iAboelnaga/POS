//
//  AddNewEmpVC.swift
//  Pos1
//
//  Created by Aboelnaga on 7/2/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit
import SFaceCompare
import Kingfisher
class AddNewEmpVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    
    let img:String = UserDefaults.standard.object(forKey: "userImg") as! String
    var e : String?
    var img2:UIImage = #imageLiteral(resourceName: "UI-avatar 2-1")
    var img3:UIImage = #imageLiteral(resourceName: "UI-avatar 2-1")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagesUrl = URL(string: img)
        let resource = ImageResource(downloadURL: imagesUrl!)
        
        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                print("Image: \(value.image). Got from: \(value.cacheType)")
                self.img2 = value.image
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    private func handleRefresh(is_attendance:Bool){
        APIsRequests.attendance(user_id: "58", attendance_flage: 1, is_attendance: is_attendance) { (error:Error?, success:Bool) in
            if success{
                if is_attendance == true{
                self.show(message: "Faces are the same!")
                }
            else{
                self.show(message: self.e ?? "")
                }
            }
        }
    }
    
    @IBAction func addImg(_ sender: Any)
    {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        //pickerController.sourceType = .photoLibrary
        pickerController.sourceType = .camera
        self.present(pickerController, animated: true, completion: nil)
    }
    @IBAction func done(_ sender: Any)
    {
        let faceComparator = SFaceCompare.init(on: img2, and: img3)
        faceComparator.compareFaces(succes: { [weak self] results in
            print("Yay! Faces are the same!")
            self?.handleRefresh(is_attendance: true)
            //self?.activityIndicator.stopAnimating()
            //self?.view.backgroundColor = UIColor.green
            //self?.infoLabel.text = "Yay! Faces are the same!"
            }, failure: { [weak self] error in
                print((error as? SFaceError)?.localizedDescription as Any)
                self?.e = (error as? SFaceError)?.localizedDescription as! String
                self?.handleRefresh(is_attendance: false)
                //self?.activityIndicator.stopAnimating()
                //self?.infoLabel.text = (error as? SFaceError)?.localizedDescription
                //self?.view.backgroundColor = UIColor.red
        })

    }
    @IBAction func backAction(_ sender: Any)
    {
        var VC = CategoriesVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
        self.present(VC, animated: false, completion: nil)
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
extension AddNewEmpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImg = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            profileImg.image = editedImg
            img3 = editedImg
        } else if let originalImg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImg.image = originalImg
            img3 = originalImg
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
