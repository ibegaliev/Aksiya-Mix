//
//  ChooseLanguageViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

class ChooseLanguageViewController: UIViewController {
    
    let viewModel = ChooseLanguageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        view = viewModel.view
    }
    
}
