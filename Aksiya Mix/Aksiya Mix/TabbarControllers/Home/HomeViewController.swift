//
//  HomeViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

class HomeViewController: AksiyaViewController, HomeViewDelegate, SingleCategoryControllerDelegate {
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = .home
        viewModel.view.delegate = self
        backView.backView.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(backView.backView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isUserInteractionEnabled = true
    }
    
    func tapped() {
        let controller = SingleProductViewController()
        controller.viewModel.id = 106
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func offerViewSelected(index: Int?) {
        
    }
    
    override func searchTapped() {
        let controller = RecentlySearchController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func showAllCategorys() {
        tabBarController?.selectedIndex = 1
    }
    
    func selectItem(index: CategoryModel?) {
        let controller = SingleCategoryController()
        controller.viewModel.delegate = self
        controller.viewModel.data = index
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func subCategorySelected(childs: [SubCategoryDM]?, categoryData: CategoryModel?) {
        let controller = SingleCategoryController()
        controller.viewModel.delegate = self
        controller.viewModel.childData = childs
        controller.viewModel.data = categoryData
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func chilCategorySelected(selectedChild: SubCategoryDM?) {
        let controller = SearchController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
