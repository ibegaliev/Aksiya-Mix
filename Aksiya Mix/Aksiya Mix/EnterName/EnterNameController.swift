//
//  EnterNameController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class EnterNameController: UIViewController, EnterNameViewDelegate {
    
    let viewModel = EnterNameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
        viewModel.view.delegate = self
        setDismissButton()
    }
    
    func setDismissButton() {
        let dismiss = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissTapped))
        
        navigationItem.leftBarButtonItem = dismiss
    }
    
    @objc
    func dismissTapped() {
        dismiss(animated: true)
    }
    
    func nextTapped(name: String?) {
        viewModel.data?.name = name
        print(viewModel.data)
        UserTokenManager.manager.saveData(data: viewModel.data)
    }

}
