//
//  Ex+String.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

extension String {
    
    var toImage: UIImage {
        return UIImage(named: self) ?? UIImage()
    }
    
    var toColor: UIColor {
        return UIColor(named: "backColor") ?? UIColor()
    }
    
}
