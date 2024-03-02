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
        var telPhone = "+998 "
        
        for n in number.enumerated() {
//            if n.element != " " {
                telPhone.append(n.element)
//            }
        }
        
        print(telPhone, "Phonme")
        viewModel.validateUzbekPhoneNumber(telPhone) { isNumber in
            if isNumber {
                let controller = EnterCodeViewController()
                
                self.navigationController?.pushViewController(controller, animated: true)
            } else {
                print("ERRORRRR")
            }
        }
    }

}
