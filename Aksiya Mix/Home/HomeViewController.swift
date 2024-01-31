//
//  HomeViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

class HomeViewController: BaseViewController {
    
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.backView.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalTo(backView.backView)
        }
        
    }
    
}
