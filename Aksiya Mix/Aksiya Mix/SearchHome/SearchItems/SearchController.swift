//
//  SearchController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class SearchController: AksiyaViewController, SearchItemsDelegate {
    
    var viewModel = SearchViewModel()
    
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
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isUserInteractionEnabled = true
    }
    
    private func setUI() {
        viewModel.resultView.delegate = self
        view.addSubview(viewModel.resultView)
        viewModel.resultView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }    
    
    override func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
