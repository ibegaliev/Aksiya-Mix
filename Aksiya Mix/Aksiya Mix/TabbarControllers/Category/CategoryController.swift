//
//  CategoryController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

class CategoryController: UIViewController, CategoryViewDelegate, SingleCategoryControllerDelegate {
    
    let viewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
        viewModel.view.delegate = self
    }
    
    func selected(index: CategoryModel?) {
        let controller = SingleCategoryController()
        controller.viewModel.delegate = self
        controller.viewModel.data = index
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func subCategorySelected(childs: [SubCategoryDM]?, categoryData: CategoryModel?) {
        let controller = SingleCategoryController()
        controller.viewModel.delegate = self
        controller.viewModel.childData = childs
        controller.viewModel.data = categoryData
        navigationController?.pushViewController(controller, animated: true)
    }

    func chilCategorySelected(selectedChild: SubCategoryDM?) {
        let controller = SearchController()
        
        navigationController?.pushViewController(controller, animated: true)
    }

    
}
