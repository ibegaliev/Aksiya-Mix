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
    
    func nextTapped() {
        dismiss(animated: true)
    }
    
    func setDismissButton() {
        let dismiss = UIBarButtonItem(title: "dismiss", style: .plain, target: self, action: #selector(dismissTapped))
        
        navigationItem.leftBarButtonItem = dismiss
    }
    
    @objc
    func dismissTapped() {
        dismiss(animated: true)
    }
    
}
