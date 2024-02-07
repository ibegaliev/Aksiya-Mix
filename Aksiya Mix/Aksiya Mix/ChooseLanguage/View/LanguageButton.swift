//
//  LanguageButton.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

class LanguageButton: UIView {
    
    var isSelected: Bool? {
        get {
            return nil
        }
        set {
            guard let newValue else { return }
            if newValue {
                icon.image = .indicatorSelect
                layer.borderColor = UIColor.selectBlue.cgColor
                layer.borderWidth = 1
            } else {
                icon.image = .indicatorunSelect
                layer.borderWidth = 0
            }
        }
    }
    
    var title: String? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    lazy var icon: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
        layer.cornerRadius = 8
        clipsToBounds = true
        backgroundColor = .fieldBack
    }
    
    private func setConstraints() {
        
    }
    
}
