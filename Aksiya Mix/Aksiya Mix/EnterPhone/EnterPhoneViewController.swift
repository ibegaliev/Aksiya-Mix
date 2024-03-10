//
//  EnterPhoneViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class EnterPhoneViewController: UIViewController, EnterPhoneViewDelegate {
    
    let viewModel = EnterPhoneViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
        viewModel.view.delegate = self
        setDismissButton()
    }

    func saveTapped(number: String?) {
        
        guard let number else { return }
        var telPhone = "+998"
        
        for n in number.enumerated() {
            if n.element != " " {
                telPhone.append(n.element)
            }
        }
        
        viewModel.validateUzbekPhoneNumber(telPhone) { [self] isNumber in
            if isNumber {
                viewModel.sentCode(number: telPhone) { [self] phoneNumber in
                    let controller = EnterCodeViewController()
                    controller.viewModel.phoneNumber = telPhone
                    navigationController?.pushViewController(controller, animated: true)
                } error: { [self] error in
                    alert(title: error)
                }
            } else {
                alert(title: "Invalid phone Number")
            }
        }
    }
    
    func alert(title: String?) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
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
