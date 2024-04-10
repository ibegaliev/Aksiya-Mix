//
//  SingleCategoryController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

protocol SingleCategoryControllerDelegate {
    func subCategorySelected(childs: [SubCategoryDM]?, categoryData: CategoryModel?)
    func chilCategorySelected(selectedChild: SubCategoryDM?)
}

class SingleCategoryController: AksiyaViewController, SingleCategoryViewDelegate {
    
    let viewModel = SingleCategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view.delegate = self
        view.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func selectCategory(index: Int) {
        
    }
    
    func subCategorySelected(childs: [SubCategoryDM]?, categoryData: CategoryModel?) {
        viewModel.delegate?.subCategorySelected(childs: childs, categoryData: categoryData)
    }

    func chilCategorySelected(selectedChild: SubCategoryDM?) {
        viewModel.delegate?.chilCategorySelected(selectedChild: selectedChild)
    }

    
}
