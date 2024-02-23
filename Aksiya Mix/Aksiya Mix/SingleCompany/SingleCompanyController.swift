//
//  Controller.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class SingleCompanyController: AksiyaViewController {
    
    let viewModel = SingleCompanyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = BaseMode.none
        backView.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
}
