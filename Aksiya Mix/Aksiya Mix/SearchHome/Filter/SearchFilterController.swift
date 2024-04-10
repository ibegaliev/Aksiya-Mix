//
//  SearchFilterController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/04/24.
//

import UIKit

class SearchFilterController: AksiyaViewController, SearchFilterViewDelegate, CategoryViewDelegate {
    
    let viewModel = SearchFilterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        title = "Filtrlar"
        viewModel.view.delegate = self
        view.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func selected(index: CategoryModel?) {
        
    }
    
    func selectedCategoryTapped() {
        let controller = CategoryController()
        controller.viewModel
        present(UINavigationController(rootViewController: controller), animated: true)
    }
        
    func selectedCityTapped() {
        
    }
    
}
