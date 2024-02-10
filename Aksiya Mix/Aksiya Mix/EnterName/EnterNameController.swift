//
//  EnterNameController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class EnterNameController: UIViewController {
    
    let viewModel = EnterNameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
    }
}
