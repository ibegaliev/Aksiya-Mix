//
//  SearchView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit
import SnapKit

class SearchView: UIView {
    
    lazy private var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fill
        stack.axis = .horizontal
        return stack
    }()
    
    lazy private var textField: SearchTextField = {
        let tf = SearchTextField()
        
        return tf
    }()
    
    lazy var rightButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.navigation_bell, for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(mainStack)
        
        mainStack.addArrangedSubview(textField)
        mainStack.addArrangedSubview(rightButton)
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self).inset(16)
        }
        rightButton.snp.makeConstraints { make in
            
        }
    }
    
}

class SearchTextField: UIView {
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        return stack
    }()
    
    lazy private var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .navigation_search
        return imageView
    }()
    
    lazy var tf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Поиск"
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backColor
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
        clipsToBounds = true
        layer.cornerRadius = 8
        backgroundColor = .backColor
        
        addSubview(stack)
        
        [icon, tf].forEach { item in
            stack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(10)
            make.left.right.equalTo(self).inset(16)
        }
        icon.snp.makeConstraints { make in
            make.width.height.equalTo(20.toScreen)
        }
    }
    
}
