//
//  LaunchScreenController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

class LaunchScreenController: UIViewController, LaunchViewDelegate {
    
    let viewModel = LaunchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
        viewModel.view.delegate = self
    }
    
    func animateDidFinish() {
        let controller = ChooseLanguageViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: false)
    }
    
}
