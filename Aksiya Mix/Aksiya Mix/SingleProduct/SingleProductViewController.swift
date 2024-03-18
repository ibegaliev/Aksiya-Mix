//
//  SingleProductViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

class SingleProductViewController: AksiyaViewController {
    
    var viewModel = SingleProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        mode = BaseMode.none
        viewModel.view.delegate = self
        backView.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    private func setNavigation() {
            navigationItem.rightBarButtonItems = [
                UIBarButtonItem(
                    image: .shareRight,
                    style: .done,
                    target: self,
                    action: #selector(shareTapped)
                ),
                UIBarButtonItem(
                    image: .heartUnSelect,
                    style: .done,
                    target: self,
                    action: #selector(likeTapped)
                )
            ]
    }
    
    @objc
    func shareTapped() {
        DispatchQueue.main.async {
            let item : URL = URL(string: "https://aksiyamix.uz/")!
            let acController = UIActivityViewController(
                activityItems: [item],
                applicationActivities: nil
            )
            acController.activityItemsConfiguration = [
                UIActivity.ActivityType.message
            ] as? UIActivityItemsConfigurationReading
            acController.excludedActivityTypes = [
                UIActivity.ActivityType.postToWeibo,
                UIActivity.ActivityType.print,
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.addToReadingList,
                UIActivity.ActivityType.postToFlickr,
                UIActivity.ActivityType.postToVimeo,
                UIActivity.ActivityType.postToTencentWeibo,
                UIActivity.ActivityType.postToFacebook
            ]
            acController.isModalInPresentation = true
            self.present(acController, animated: true, completion: nil)
        }
    }
    
    @objc
    func likeTapped() {
        
    }
    
}

extension SingleProductViewController: SingleProductViewDelegate {
    
    func backViewTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func shareButtonTapped() {
        
    }
    
    func likeButtonTapped() {
        
    }
    
}
