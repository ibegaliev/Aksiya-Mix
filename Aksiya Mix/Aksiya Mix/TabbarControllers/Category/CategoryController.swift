//
//  CategoryController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

class CategoryController: UIViewController {
    
    let viewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
    }
    
}
