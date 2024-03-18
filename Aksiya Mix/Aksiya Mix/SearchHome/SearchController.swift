//
//  SearchController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class SearchController: UIViewController {
    
    var viewModel = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.addSubview(viewModel)
        viewModel.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
        
}
