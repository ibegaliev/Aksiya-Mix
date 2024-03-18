//
//  HomeViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

class HomeViewController: AksiyaViewController, HomeViewDelegate {
    
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = .home
        homeView.delegate = self
        backView.backView.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalTo(backView.backView)
        }
    }
    
    func tapped() {
        let controller = SingleProductViewController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func offerViewSelected(index: Int?) {
        
    }
    
    override func searchTapped() {
        super.searchTapped()
    }
    

}
