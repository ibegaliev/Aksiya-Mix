//
//  SingleNavigationVIew.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

class SingleNavigationVIew: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.spacing = 16
        return stack
    }()
    
    lazy var rightStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 16
        return stack
    }()
    
    lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(.arrowLeft, for: .normal)
        return btn
    }()
    
    lazy var shareButton: UIButton = {
        let btn = UIButton()
        btn.setImage(.shareProduct, for: .normal)
        return btn
    }()
    
    lazy var heardButton: UIButton = {
        let btn = UIButton()
        btn.setImage(.heart, for: .normal)
        return btn
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
        addSubview(mainStack)
        
        [closeButton, rightStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [shareButton, heardButton].forEach { item in
            rightStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(16)
        }
        [closeButton, shareButton, heardButton].forEach { item in
            item.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
        }
    }
    
}
