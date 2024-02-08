//
//  BlueButton.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

class BlueButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .selectBlue
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}