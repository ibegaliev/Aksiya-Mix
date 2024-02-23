//
//  SearchController.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class SearchController: AksiyaViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mode = .search
    }
    
    override func backButtonTapped() {
        dismiss(animated: true)
    }
    
    override func optionsTapped() {
        
    }
    
}
