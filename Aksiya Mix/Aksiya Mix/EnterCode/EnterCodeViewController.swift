//
//  EnterCodeViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class EnterCodeViewController: UIViewController, EnterCodeViewDelegate {
    
    let viewModel = EnterCodeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
        viewModel.view.delegate = self
    }
    
    func sentTapped() {
        let controller = EnterNameController()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
}
