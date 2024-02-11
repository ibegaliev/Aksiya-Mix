//
//  BaseViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

class BaseViewController: UIViewController, BaseViewDelegate {
        
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
        
    func backButtonTapped() {
        
    }
    
    func notificationTapped() {
        
    }
    
    func optionsTapped() {
        
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) {
        
    }
    
}
