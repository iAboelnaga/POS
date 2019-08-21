//
//  AddNewEmpVC.swift
//  Pos1
//
//  Created by Aboelnaga on 7/2/19.
//  Copyright © 2019 Ahmed_Aboelnaga. All rights reserved.
//

import UIKit

class AddNewEmpVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addImg(_ sender: Any)
    {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        //pickerController.sourceType = .camera
        self.present(pickerController, animated: true, completion: nil)
    }
    @IBAction func done(_ sender: Any)
    {
        //TODO
    }
    @IBAction func backAction(_ sender: Any)
    {
        var VC = CategoriesVC()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        VC = storyBoard.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
        self.present(VC, animated: false, completion: nil)
    }
    
}
extension AddNewEmpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImg = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            profileImg.image = editedImg
        } else if let originalImg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImg.image = originalImg
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
