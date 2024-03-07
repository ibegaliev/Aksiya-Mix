//
//  ChooseLanguageViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

class ChooseLanguageViewController: UIViewController, ChooseLanguageViewDelegate {
    
    let viewModel = ChooseLanguageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        view = viewModel.view
        viewModel.view.delegate = self
    }
    
    func confirmTapped() {
        let controller = UINavigationController(rootViewController: TabbarController())
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }

    
}
