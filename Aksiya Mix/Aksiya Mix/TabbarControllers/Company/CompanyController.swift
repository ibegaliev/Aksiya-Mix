//
//  CompanyController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class CompanyController: BaseViewController {
    
    var viewModel = CompanyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = .option
        backView.backView.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.top.equalTo(backView.backView)
            make.left.right.bottom.equalTo(backView.backView)
        }
    }
    
}
