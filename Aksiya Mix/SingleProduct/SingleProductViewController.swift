//
//  SingleProductViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

class SingleProductViewController: UIViewController {
    
    var viewModel = SingleProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = viewModel.view
    }
    
}
