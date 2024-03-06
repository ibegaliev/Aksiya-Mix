//
//  OTPField.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 04/03/24.
//

import UIKit

protocol OTPFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
}

class OTPField: UITextField, UITextFieldDelegate {
    
    var dataSource: OTPFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        backgroundColor = .backBlue
        layer.cornerRadius = 6
        clipsToBounds = true
        textAlignment = .center
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        self.delegate = self
        font = .appFont(ofSize: 18, weight: .semibold)
    }
    
    private func setConstraints() {
        snp.makeConstraints { make in
            make.width.height.equalTo(48.toScreen)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
}
