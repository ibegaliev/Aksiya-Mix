//
//  UserViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/02/24.
//

import UIKit

class UserViewController: AksiyaViewController, UserViewDelegate, AlertViewDelegate, EnterPhoneViewControllerDelegate {
    
    var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
        viewModel.view.delegate = self
        viewModel.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setController() {
        view.addSubview(viewModel.view)
        viewModel.view.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func auth() {
        let controller = EnterPhoneViewController()
        controller.viewModel.delegate = self
        let navController = UINavigationController(rootViewController: controller)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
        
    func okTapped() {
        UserTokenManager.manager.removeDates()
        viewModel.view.setData()
    }
    
    func cancelTapped() {
        viewModel.view.setData()
    }
    
    func saved(data: UserTokenDM?) {
        viewModel.view.setData()
        viewModel.getData()
        viewModel.uploadData(
            data: UserData(fullname: data?.name)
        )
    }

}

extension UserViewController {
    
    func editProfileTapped() {
        let controller = ProfileEditController()
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func aboutTapped() {
        let controller = AboutAppConstroller()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: false)
    }

    func loguotTapped() {
        let alert = AlertController()
        alert.viewModel.delegate = self
        alert.modalPresentationStyle = .overFullScreen
        present(alert, animated: false)
    }
    
}
