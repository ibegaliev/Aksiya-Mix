//
//  SelectCategoryController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 09/04/24.
//

import UIKit

class SelectCategoryController: AksiyaViewController, CategoryViewDelegate {
    
    let viewModel = SelectCategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        viewModel.view.delegate = self
        view.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func selected(index: CategoryModel?){
        let controller = SingleCategoryController()
        controller.viewModel.data = index
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
