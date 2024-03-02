//
//  InputFieldView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class InputFieldView: UIView, UITextFieldDelegate {
    
    lazy var inputField: UITextField = {
        let tf = UITextField()
        tf.delegate = self
        tf.placeholder = LyricsManager.getLyrics(type: .name)
        tf.font = .appFont(ofSize: 16, weight: .regular)
        return tf
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
        backgroundColor = .fieldBack
        layer.cornerRadius = 9
        clipsToBounds = true
        addSubview(inputField)
    }
    
    private func setConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        inputField.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(12)
            make.left.right.equalTo(self).inset(16)
        }
    }
    
    func formatPhoneNumber(_ textField: UITextField, range: NSRange, replacementString string: String) -> Bool {
        // Get the current text in the text field
        guard let text = textField.text else {
            return true
        }
        
        // Check if the user is deleting characters
        if string.isEmpty {
            return true
        }
        
        // Append the new character to the existing text
        let newText = (text as NSString).replacingCharacters(in: range, with: string)
        
        // Remove any non-numeric characters from the text
        let numericText = newText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        // Check if the text has a valid length
        guard numericText.count <= 11 else {
            return false
        }
        
        // Format the phone number as per the specified pattern
        var formattedNumber = "+998 "
        let components = Array(numericText)
        for (index, character) in components.enumerated() {
            if index == 2 || index == 5 || index == 7 || index == 9 {
                formattedNumber += " "
            }
            formattedNumber += String(character)
        }
        
        // Update the text field with the formatted number
        textField.text = formattedNumber
        
        return false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return formatPhoneNumber(textField, range: range, replacementString: string)
    }

}
