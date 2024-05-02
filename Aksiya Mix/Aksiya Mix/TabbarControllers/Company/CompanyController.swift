//
//  CompanyController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class CompanyController: AksiyaViewController, CompanyViewDelegate {
    
    var viewModel = CompanyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = .option
        backView.backView.addSubview(viewModel.view)
        viewModel.view.delegate = self
        viewModel.view.snp.makeConstraints { make in
            make.top.equalTo(backView.backView)
            make.left.right.bottom.equalTo(backView.backView)
        }
    }
    
    func selectedCompany(index: Int) {
        let controller = SingleCompanyController()
        controller.viewModel.id = 2
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
