//
//  EnterNameController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

protocol EnterNameDelegate {
    func saved(data: UserTokenDM?)
}

class EnterNameController: UIViewController, EnterNameViewDelegate {
    
    let viewModel = EnterNameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view.delegate = self
        view = viewModel.view
        setDismissButton()
    }
    
    func setDismissButton() {
        let dismiss = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissTapped))
        
        navigationItem.leftBarButtonItem = dismiss
    }
    
    func nextTapped(name: String?) {
        dismissTapped()
        viewModel.data?.name = name
        UserTokenManager.manager.saveData(data: viewModel.data)
        viewModel.delegate?.saved(data: viewModel.data)
    }
    
    @objc
    func dismissTapped() {
        dismiss(animated: true)
    }
    
}
