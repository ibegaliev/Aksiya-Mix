//
//  AboutAppConstroller.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 04/04/24.
//

import UIKit

class AboutAppConstroller: UIViewController, AboutViewDelegate {
    
    let viewModel = AboutViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        view = viewModel.view
        viewModel.view.delegate = self
    }
    
    func backTapped() {
        dismiss(animated: true)
    }
    
}
