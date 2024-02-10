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
        mode = .none
        viewModel.view.delegate = self
        backView.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
}

extension SingleProductViewController: SingleProductViewDelegate {
    
    func backViewTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func shareButtonTapped() {
        
    }
    
    func likeButtonTapped() {
        
    }
    
}
