//
//  LanguageButton.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

protocol LanguageButtonDelegate {
    func selected(index: Int)
}

class LanguageButton: UIView {
    
    var delegate: LanguageButtonDelegate?
    
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
        stack.spacing = 16
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        setGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
        layer.cornerRadius = 8
        clipsToBounds = true
        backgroundColor = .fieldBack
        
        addSubview(stack)
        
        [icon, titleLabel].forEach { item in
            stack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(14)
            make.left.right.equalTo(self).inset(16)
        }
        icon.snp.makeConstraints { make in
            make.height.width.equalTo(20)
        }
    }
    
    private func setGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selected))
        addGestureRecognizer(gesture)
        isUserInteractionEnabled = true
    }
    
    @objc
    func selected() {
        delegate?.selected(index: tag)
    }
    
}
