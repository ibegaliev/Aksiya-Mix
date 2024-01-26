//
//  BaseViewController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }

    private func setUI () {
        view.backgroundColor = .backColor
    }
    
    private func setConstraints() {
        
    }
}
