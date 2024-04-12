//
//  AddNewMarketController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/04/24.
//

import UIKit

class AddNewMarketController: AksiyaViewController, AddNewMarketViewDelegate {
    
    let viewModel = AddNewMarketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
    }
        
    private func setController() {
        viewModel.view.delegate = self
        view.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func tappedNextButton() {
        let controller = CreateMarketController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
