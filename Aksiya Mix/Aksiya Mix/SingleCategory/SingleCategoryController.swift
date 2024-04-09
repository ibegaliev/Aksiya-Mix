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
        let controller = SingleCategoryController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
