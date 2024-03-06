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
        setUI()
    }
    
    private func setUI() {
        DispatchQueue.main.sync {
            backView.addSubview(viewModel.view)
            viewModel.view.snp.makeConstraints { make in
                make.edges.equalTo(view)
            }
        }
    }
    
}
