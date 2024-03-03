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
                    
                    navigationController?.pushViewController(controller, animated: true)
                } error: { error in
                    let alert = UIAlertController(title: error, message: nil, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .cancel)
                    alert.addAction(okAction)
                    present(alert, animated: true)
                }
            } else {
                print("ERRORRRR")
            }
        }
    }

}
