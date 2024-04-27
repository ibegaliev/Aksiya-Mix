//
//  CreateMarketController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 12/04/24.
//

import UIKit

class CreateMarketController: AksiyaViewController {
    
    var viewModel = CreateMarketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        title = "Do'kon qo'shish"
        view.addSubview(viewModel.view)
        viewModel.view.delegate = self
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
}

extension CreateMarketController: CreateMarketViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imageSelected() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(imagePickerDone))
            imagePicker.navigationItem.rightBarButtonItem = doneButton
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            viewModel.selectedImage = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerDone() {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
