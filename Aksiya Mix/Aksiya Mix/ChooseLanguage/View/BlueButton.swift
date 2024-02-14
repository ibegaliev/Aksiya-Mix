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
        
        backgroundColor = .backBlue
        setTitleColor(.selectBlue, for: .normal)
        layer.cornerRadius = 8
        clipsToBounds = true
        titleLabel?.font = .appFont(ofSize: 16, weight: .medium)
        
        snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
