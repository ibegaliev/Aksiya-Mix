//
//  RecentlySearchController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 25/03/24.
//

import UIKit

class RecentlySearchController: AksiyaViewController {
    
    var viewModel = RecentlySearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        backView.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(backView)
        }
    }
    
}
