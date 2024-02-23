//
//  ShowResultView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 17/02/24.
//

import UIKit

class ShowResultView: UIView {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "137 ta natija topildi"
        lbl.font = .appFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    lazy var changeButton: UIButton = {
        let lbl = UIButton()
        lbl.setImage(.gridSelect, for: .normal)
        return lbl
    }()
    
    lazy var rightButton: UIButton = {
        let lbl = UIButton()
        lbl.setImage(.gridSelect, for: .normal)
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var rightStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
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
        addSubview(mainStack)
        [titleLabel, rightStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [changeButton, rightButton].forEach { item in
            rightStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.right.equalTo(self).inset(16)
        }
        changeButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
    }

}