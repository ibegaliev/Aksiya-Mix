//
//  LikedController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/02/24.
//

import UIKit
import SnapKit

class LikedController: BaseViewController {
    
    let viewModel = LikedViewModel()
    
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
