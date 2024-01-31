//
//  SingleProductViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

class SingleProductViewController: BaseViewController {
    
    var viewModel = SingleProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
}
