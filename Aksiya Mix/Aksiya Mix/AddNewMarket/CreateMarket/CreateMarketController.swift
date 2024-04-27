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
    
    private func setAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "cancel", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

extension CreateMarketController: CreateMarketViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func saveDataTapped(data: CreateMarketDM) {
        
        if let _ = data.owner_firstname {
            if let _ = data.owner_lastname {
                if let _ = data.owner_fathername {
                    if let _ = data.name_uz, let _ = data.name_ru {
                        if let _ = data.owner_fathername {
                            if let _ = data.working_day_start,
                               let _ = data.working_day_end,
                               let _ = data.working_time_start,
                               let _ = data.working_time_end {
                                if let _ = data.delivery {
                                    if let _ = data.region, let _ = data.district {
                                        if let _ = data.main_phone_number {
                                            if let _ = data.desc_ru, let _ = data.desc_uz {
                                                createMarket(data: data)
                                            } else {
                                                setAlert(title: "Do'konning qisqacha tasnifini kiriting")
                                            }
                                        } else {
                                            setAlert(title: "Do'konning telefon raqamini kiriting")
                                        }
                                    } else {
                                        setAlert(title: "Manzilni kiriting")
                                    }
                                } else {
                                    setAlert(title: "Yetkazib berish xizmatini tanlang")
                                }
                            } else {
                                setAlert(title: "Do'konni ishlash vaqtini kiriting")
                            }
                        } else {
                            setAlert(title: "Do'konning qisqacha nomini kiriting")
                        }
                    } else {
                        setAlert(title: "Do'konni ismini kiriting")
                    }
                } else {
                    setAlert(title: "Do'kon egasini sharfini kiriting")
                }
            } else {
                setAlert(title: "Do'kon egasini familiyasini kiriting")
            }
        } else {
            setAlert(title: "Do'kon egasini ismini kiriting")
        }
        
    }

    func createMarket(data: CreateMarketDM) {
        viewModel.createMarket(data: data) {
            
        }
    }
    
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
