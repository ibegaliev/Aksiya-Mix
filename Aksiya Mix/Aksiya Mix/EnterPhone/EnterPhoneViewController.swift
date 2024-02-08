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
        let controller = EnterCodeViewController()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }

}
