//
//  InputNumberView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class InputNumberView: UIView {
    
    lazy var leftLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "+998"
        lbl.font = .appFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    
    lazy var field: UITextField = {
        let fl = UITextField()
        fl.keyboardType = .numberPad
        fl.font = .appFont(ofSize: 14, weight: .regular)
        return fl
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
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
        
        addSubview(stack)
        
        [leftLabel, field].forEach { item in
            stack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        stack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(14)
            make.left.right.equalTo(self).inset(16)
        }
        
        leftLabel.snp.makeConstraints { make in
            make.width.equalTo(35)
        }
    }
    
}
