//
//  SearchController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class SearchController: AksiyaViewController {
    
    var viewModel = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        mode = BaseMode.none
        backView.addSubview(viewModel)
        viewModel.snp.makeConstraints { make in
            make.edges.equalTo(backView)
        }
    }
        
}
