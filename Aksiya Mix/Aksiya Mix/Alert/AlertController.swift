//
//  AlertController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 20/03/24.
//

import UIKit

protocol AlertControllerDelegate {
    func okTapped()
    func cancelTapped()
}

class AlertController: UIViewController, AlertViewDelegate {
    
    let viewModel = AlertViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view = viewModel.view
        viewModel.view.delegate = self
    }
    
    func okTapped() {
        viewModel.delegate?.okTapped()
        dismiss(animated: false)
    }
    
    func cancelTapped() {
        viewModel.delegate?.cancelTapped()
        dismiss(animated: false)
    }
    
}
