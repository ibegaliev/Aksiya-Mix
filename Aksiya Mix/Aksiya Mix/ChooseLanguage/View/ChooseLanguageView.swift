//
//  ChooseLanguageView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

class ChooseLanguageView: UIView {
    
    lazy var mainLogo: UIImageView = {
        let image = UIImageView()
        image.image = .appicon
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    lazy var uzbButton: UIView = {
        let btn = UIView()
        
        return btn
    }()
    
    lazy var ruButton: UIView = {
        let btn = UIView()
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        backgroundColor = .systemTeal
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
    }
    
    private func setConstraints() {
        
    }
    
}

class LanguageButton: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
