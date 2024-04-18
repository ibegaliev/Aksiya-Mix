//
//  CreateMarketController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 12/04/24.
//

import UIKit

class CreateMarketController: AksiyaViewController {
    
    var viewModel = CreateMarketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        title = "Do'kon qo'shish"
        view.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
}
