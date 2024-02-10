//
//  HeaderView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/30/24.
//

import UIKit

class HeaderView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()
    
    lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        return stack
    }()
    
    lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.image = .broIcon
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Mak bro"
        lbl.textColor = .white
        lbl.font = .boldSystemFont(ofSize: 10)
        return lbl
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.setImage(.heard_Icon, for: .normal)
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
        
        [leftStack, button].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [iconView, titleLabel].forEach { item in
            leftStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.right.equalTo(self).inset(8)
        }
        iconView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        button.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
    }
    
}


