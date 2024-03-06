//
//  OtpFieldView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

protocol OtpFieldViewDelegate {
    func otp(otp: String)
}

class OtpFieldView: UIView, OTPFieldDelegate, UITextFieldDelegate {
    
    var delegate: OtpFieldViewDelegate?
    
    var code: String? {
        didSet {
            guard let code else { return }
            if code.count >= 5 {
                delegate?.otp(otp: code)
                field5.resignFirstResponder()
            }
        }
    }
    
    lazy var field1: OTPField = {
        let field = OTPField()
        field.delegate = self
        field.becomeFirstResponder()
        return field
    }()
    
    lazy var field2: OTPField = {
        let field = OTPField()
        field.delegate = self
        return field
    }()
    
    lazy var field3: OTPField = {
        let field = OTPField()
        field.delegate = self
        return field
    }()
    
    lazy var field4: OTPField = {
        let field = OTPField()
        field.delegate = self
        return field
    }()
    
    lazy var field5: OTPField = {
        let field = OTPField()
        field.delegate = self
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let code else {
            field1.becomeFirstResponder()
            return
        }
        if code.count < 1 {
            field1.becomeFirstResponder()
        } else if code.count < 2 {
            field2.becomeFirstResponder()
        } else if code.count < 3 {
            field3.becomeFirstResponder()
        } else if code.count < 4 {
            field4.becomeFirstResponder()
        } else if code.count < 5 {
            field5.becomeFirstResponder()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if code?.count ?? 0 >= 5 { field5.resignFirstResponder(); return true }
        if string == "" {
            code?.removeLast()
        } else {
            self.code?.append(string)
            if code == nil { code = string }
        }
        
        print(code ?? "", "CODEE")
        
        if code?.count == 0 {
            field1.becomeFirstResponder()
        } else if code?.count == 1 {
            field1.text = string
            field2.becomeFirstResponder()
        } else if code?.count == 2 {
            field2.text = string
            field3.becomeFirstResponder()
        } else if code?.count == 3 {
            field3.text = string
            field4.becomeFirstResponder()
        } else if code?.count == 4 {
            field4.text = string
            field5.becomeFirstResponder()
        } else {
            field5.text = string
            return false
        }
        
        print(string)
        
        return true
    }

    
}
