//
//  LikedController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/02/24.
//

import UIKit
import SnapKit

class LikedController: BaseViewController, LikedViewDelegate {
    
    let viewModel = LikedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
    
    private func setController() {
        
        viewModel.view.delegate = self
        viewModel.view.selectedItem = 0
        
        view.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
    }
    
    func selectedSaved() {
        viewModel.view.selectedItem = 0
    }
    
    func selectedSeen() {
        viewModel.view.selectedItem = 1
    }
    
    func selectedended() {
        viewModel.view.selectedItem = 2
    }

    
}
