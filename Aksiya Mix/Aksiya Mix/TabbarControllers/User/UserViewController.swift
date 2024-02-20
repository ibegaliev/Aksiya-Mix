//
//  UserViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/02/24.
//

import UIKit

class UserViewController: BaseViewController {
    
    var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        view.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
}
