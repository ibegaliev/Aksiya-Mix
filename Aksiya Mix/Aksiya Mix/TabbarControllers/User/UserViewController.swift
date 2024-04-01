//
//  UserViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/02/24.
//

import UIKit

class UserViewController: AksiyaViewController, UserViewDelegate, AlertViewDelegate {
    
    var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
        viewModel.view.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.view.tableView.reloadData()
    }
    
    private func setController() {
        view.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func auth() {
        let controller = UINavigationController(rootViewController: EnterPhoneViewController())
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    func loguotTapped() {
        let alert = AlertController()
        alert.viewModel.delegate = self
        alert.modalPresentationStyle = .overFullScreen
        present(alert, animated: true)
    }
    
    func okTapped() {
        UserTokenManager.manager.removeDates()
        viewModel.view.setData()
    }
    
    func cancelTapped() {
        viewModel.view.setData()
    }
    
}
