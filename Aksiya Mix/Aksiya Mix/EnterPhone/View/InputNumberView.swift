//
//  InputNumberView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

protocol InputNumberViewDelegate {
    func phoneNumber(number: String?)
}

class InputNumberView: UIView, UITextFieldDelegate {
    
    var delegate: InputNumberViewDelegate?
    
    lazy var leftLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "+998"
        lbl.textAlignment = .right
        lbl.font = .appFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    
    lazy var field: UITextField = {
        let fl = UITextField()
        fl.delegate = self
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
            make.width.equalTo(40)
        }
    }
    
    func formatPhoneNumber(_ textField: UITextField, range: NSRange, replacementString string: String) -> Bool {
        // Get the current text in the text field
        guard let text = textField.text else {
            return true
        }
        if string.isEmpty {
            return true
        }
        let newText = (text as NSString).replacingCharacters(in: range, with: string)
        let numericText = newText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numericText.count <= 9 else {
            return false
        }
        var formattedNumber = ""
        let components = Array(numericText)
        for (index, character) in components.enumerated() {
            if index == 2 || index == 5 || index == 7 || index == 9 {
                formattedNumber += " "
            }
            formattedNumber += String(character)
        }
        textField.text = formattedNumber
        delegate?.phoneNumber(number: formattedNumber)
        return false
    }

    func textField(
        _ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String
    ) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            if updatedText.count < 12 {
                delegate?.phoneNumber(number: updatedText)
            }
        }
        return formatPhoneNumber(textField, range: range, replacementString: string)
    }
    
}
