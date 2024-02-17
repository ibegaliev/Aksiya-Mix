//
//  HomeViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

class HomeViewController: BaseViewController, HomeViewDelegate {
    
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
    
    override func textFieldDidBeginEditing(textField: UITextField) {
        mode = .search
        homeView.viewType = .search
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        mode = .home
        homeView.viewType = .home
    }
    
    override func backButtonTapped() {
        mode = .home
        homeView.viewType = .home
    }
    
    func offerViewSelected(index: Int?) {
        homeView.viewType = .results
    }
    
}
