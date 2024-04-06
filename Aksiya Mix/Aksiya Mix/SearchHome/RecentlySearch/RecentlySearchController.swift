//
//  RecentlySearchController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 25/03/24.
//

import UIKit

class RecentlySearchController: AksiyaViewController, OfferViewDelegate {
    
    var viewModel = RecentlySearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isUserInteractionEnabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isUserInteractionEnabled = false
    }
    
    private func setUI() {
        viewModel.view.delegate = self
        backView.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(backView)
        }
    }
    
    func didSelect(indexPath: IndexPath) {
        let controller = SearchController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
