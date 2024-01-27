//
//  Ex+Int.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

extension Int {
    
    var toScreen: CGFloat {
        return CGFloat(UIWindow().frame.width) * CGFloat(self) / 375
    }
    
}
