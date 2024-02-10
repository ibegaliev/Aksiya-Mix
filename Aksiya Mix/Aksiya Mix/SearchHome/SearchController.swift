//
//  SearchController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class SearchController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = .search
    }
    
    override func backButtonTapped() {
        dismiss(animated: true)
    }
    
}
