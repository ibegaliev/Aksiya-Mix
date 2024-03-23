//
//  AlertController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 20/03/24.
//

import UIKit

class AlertController: UIViewController {
    
    let viewModel = AlertViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view = viewModel.view
    }
    
}
