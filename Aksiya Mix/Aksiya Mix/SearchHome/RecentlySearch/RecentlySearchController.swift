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
    
    private func setUI() {
        viewModel.view.delegate = self
        backView.insertSubview(viewModel.view, at: .max)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(backView)
        }
    }
    
    func didSelect(indexPath: IndexPath) {
        let controller = SearchController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
