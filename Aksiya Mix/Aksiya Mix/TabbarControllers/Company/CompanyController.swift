//
//  CompanyController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class CompanyController: BaseViewController, CompanyViewDelegate {
    
    var viewModel = CompanyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = .option
        viewModel.view.delegate = self
        backView.backView.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.top.equalTo(backView.backView)
            make.left.right.bottom.equalTo(backView.backView)
        }
    }
    
    func selectedCompany(index: Int) {
        let controller = SingleCompanyController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
