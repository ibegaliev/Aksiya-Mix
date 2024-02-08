//
//  EnterCodeViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class EnterCodeViewController: UIViewController {
    
    let viewModel = EnterCodeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
    }
    
}
