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
        if let _ = LanguageManager().getLanguage() {
            let controller = UINavigationController(rootViewController: TabbarController())
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: false)
        } else {
            let controller = ChooseLanguageViewController()
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: false)
        }
    }
    
}
