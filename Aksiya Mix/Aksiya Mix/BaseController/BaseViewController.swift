//
//  BaseViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

class AksiyaViewController: UIViewController, BaseViewDelegate {
        
    var backView = BaseView()
    
    var mode: BaseMode? {
        get {
            return .home
        }
        set {
            backView.mode = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = backView
        backView.delegate = self
        setNavigation()
        navigationItem.backButtonTitle = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isUserInteractionEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isUserInteractionEnabled = false
    }
    
    private func setNavigation() {
        navigationItem.backButtonTitle = " "
    }
    
    func searchTapped() {
        let controller = SearchController()
        
        navigationController?.pushViewController(controller, animated: true)
    }

        
    func backButtonTapped() {
        
    }
    
    func notificationTapped() {
        
    }
    
    func optionsTapped() {
        
    }
    
}
