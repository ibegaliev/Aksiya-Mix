//
//  SearchController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class SearchController: AksiyaViewController {
    
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        backView.addSubview(viewModel.resultView)
        viewModel.resultView.snp.makeConstraints { make in
            make.edges.equalTo(backView)
        }
    }    
        
}
