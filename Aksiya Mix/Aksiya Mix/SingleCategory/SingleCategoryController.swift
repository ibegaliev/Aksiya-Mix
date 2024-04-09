//
//  SingleCategoryController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

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
        let controller = SingleCategoryController()
        controller.viewModel.childData = childs
        controller.viewModel.data = categoryData
        navigationController?.pushViewController(controller, animated: true)
    }

    func chilCategorySelected(selectedChild: SubCategoryDM?) {
        print(selectedChild)
    }

    
}
