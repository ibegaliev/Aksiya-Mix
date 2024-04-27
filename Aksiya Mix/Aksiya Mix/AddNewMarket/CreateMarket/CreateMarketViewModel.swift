//
//  CreateMarketViewModel.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 12/04/24.
//

import UIKit

protocol CreateMarketViewDelegate {
    func imageSelected()
    
}

class CreateMarketViewModel {
    
    var view = CreateMarketView()
    var selectedImage: UIImage? {
        didSet {
            view.selectedImage = selectedImage
        }
    }

    func createMarket(completion: @escaping ()->()) {
        
    }
    
}
