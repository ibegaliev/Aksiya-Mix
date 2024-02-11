//
//  CategoryController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

class CategoryController: UIViewController, CategoryViewDelegate {
    
    let viewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
        viewModel.view.delegate = self
    }
    
    func selected(index: Int) {
        let controller = SingleCategoryController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
