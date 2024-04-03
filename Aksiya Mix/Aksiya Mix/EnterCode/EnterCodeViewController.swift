//
//  EnterCodeViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

protocol EnterCodeDelegate {
    func saved(data: UserTokenDM?)
}

class EnterCodeViewController: UIViewController, EnterCodeViewDelegate, EnterNameDelegate {
    
    let viewModel = EnterCodeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
        viewModel.view.delegate = self
        viewModel.view.number = viewModel.phoneNumber
        setDismissButton()
    }
    
    func sentTapped() {
        
    }
    
    func otp(otp: String) {
        viewModel.getToken(code: otp) { [self] in
            let controller = EnterNameController()
            controller.viewModel.delegate = self
            controller.viewModel.data = viewModel.data
            controller.viewModel.data?.number = viewModel.phoneNumber
            navigationController?.pushViewController(controller, animated: true)
        } error: { [self] description in
            let alert = UIAlertController(title: description, message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
    func setDismissButton() {
        let dismiss = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(dismissTapped))
        
        navigationItem.leftBarButtonItem = dismiss
    }
    
    @objc
    func dismissTapped() {
        dismiss(animated: true)
    }
    
    func saved(data: UserTokenDM?) {
        viewModel.delegate?.saved(data: data)
    }
    
}
