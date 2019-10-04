//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Александр Уткин on 02/10/2019.
//  Copyright © 2019 Александр Уткин. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    var newPlace: Place?
    
    @IBOutlet var PlaceImage: UIImageView!
    
    @IBOutlet var saveButon: UIBarButtonItem!
    
    @IBOutlet var placeName: UITextField!
    @IBOutlet var placeLocation: UITextField!
    @IBOutlet var placeType: UITextField!
           
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        saveButon.isEnabled = false
        
        placeName.addTarget(self, action: #selector(textFiledChanged), for: .editingChanged)
    }
    
    
    
    //MARK: TableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let fotoIcon = #imageLiteral(resourceName: "photo")
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            
            photo.setValue(fotoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
        }else {
            view.endEditing(true)
        }
    }
    
    func saveNewPlace() {
        newPlace = Place(name: placeName.text!,
                         location: placeLocation.text,
                         type: placeType.text,
                         image: PlaceImage.image,
                         Restourantimage: nil)
    }
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}



    //MARK: Text filed delegate
    
    extension NewPlaceViewController: UITextFieldDelegate {
                
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        @objc private func textFiledChanged() {
            if placeName.text?.isEmpty == false {
                saveButon.isEnabled = true
            } else {
                saveButon.isEnabled = false
            }
        }
    }

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        PlaceImage.image = info[.editedImage] as? UIImage
        PlaceImage.contentMode = .scaleAspectFill
        PlaceImage.clipsToBounds = true
        dismiss(animated: true)
        
    }
}
