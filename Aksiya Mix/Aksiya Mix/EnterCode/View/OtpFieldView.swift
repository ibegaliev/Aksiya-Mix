//
//  OtpFieldView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class OtpFieldView: UIView, OTPFieldDelegate {
    
    lazy var field1: OTPField = {
        let field = OTPField()
        
        return field
    }()
    
    lazy var field2: OTPField = {
        let field = OTPField()
        
        return field
    }()
    
    lazy var field3: OTPField = {
        let field = OTPField()
        
        return field
    }()
    
    lazy var field4: OTPField = {
        let field = OTPField()
        
        return field
    }()
    
    lazy var field5: OTPField = {
        let field = OTPField()
        
        return field
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
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
        [field1, field2, field3, field4, field5].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
