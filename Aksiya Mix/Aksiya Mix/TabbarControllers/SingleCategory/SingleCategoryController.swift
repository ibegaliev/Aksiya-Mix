//
//  SingleCategoryController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

class SingleCategoryController: BaseViewController {
    
    let viewModel = SingleCategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewModel.view
    }
    
}
