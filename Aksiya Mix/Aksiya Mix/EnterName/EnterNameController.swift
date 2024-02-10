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
    }
    
    func nextTapped() {
        let controller = TabbarController()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
}
