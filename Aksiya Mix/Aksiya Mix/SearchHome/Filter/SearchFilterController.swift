//
//  SearchFilterController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/04/24.
//

import UIKit

class SearchFilterController: AksiyaViewController {
    
    let viewModel = SearchFilterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        view = viewModel.view
    }
    
}
