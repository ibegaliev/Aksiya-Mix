//
//  Controller.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class SingleCompanyController: AksiyaViewController {
    
    let viewModel = SingleCompanyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setNavigation()
    }
    
    private func setUI() {
        mode = BaseMode.none
        backView.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    private func setNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: .shareRight,
            style: .done,
            target: self,
            action: #selector(sharedCompany)
        )
    }
    
    @objc
    private func sharedCompany() {
        DispatchQueue.global(qos: .userInitiated).sync {
            let item : URL = URL(string: "https://aksiyamix.uz/product-details")!
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
    
}
