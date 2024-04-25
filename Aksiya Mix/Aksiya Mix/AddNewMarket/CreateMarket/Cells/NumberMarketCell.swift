//
//  NumberMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/04/24.
//

import UIKit

protocol NumberMarketCellDelegate  {
    func sentNewNumber(number: String?)
    func errorNewNumber()
}

class NumberMarketCell: UITableViewCell, InputNumberViewDelegate, UITextFieldDelegate {
    
    var delegate: NumberMarketCellDelegate?
    
    var title: String? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var placeholder: String? {
        get {
            return nil
        }
        set {
//            textField.placeholder = newValue
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var textField: ProfileNumberEditItemView = {
        let view = ProfileNumberEditItemView()
        view.textField.keyboardType = .phonePad
        view.textField.delegate = self
        return view
    }()
    
    lazy var textFieldUZ: ProfileEditItemView = {
        let field = ProfileEditItemView()
        field.placeholder = "Tavsif (uz)"
        return field
    }()
    
    lazy var textFieldRU: ProfileEditItemView = {
        let field = ProfileEditItemView()
        field.placeholder = "Tavsif (ru)"
        return field
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        selectionStyle = .none
        contentView.backgroundColor = .backColor
        contentView.addSubview(mainStack)
        [titleLabel, textField, textFieldUZ, textFieldRU].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView).inset(16)
        }
        textField.snp.makeConstraints { make in
            make.height.equalTo(44.toScreen)
        }
    }
    
    func phoneNumber(number: String?) {
        delegate?.sentNewNumber(number: number)
    }
    
    func formatPhoneNumber(_ textField: UITextField, range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        if string.isEmpty { return true }
        let newText = (text as NSString).replacingCharacters(in: range, with: string)
        let numericText = newText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numericText.count <= 9 else { return false }
        var formattedNumber = ""
        let components = Array(numericText)
        for (index, character) in components.enumerated() {
            if index == 2 || index == 5 || index == 7 || index == 9 {
                formattedNumber += " "
            }
            formattedNumber += String(character)
        }
        textField.text = formattedNumber
        let phoneNumber = "+998\(formattedNumber.replacingOccurrences(of: " ", with: ""))"
        if phoneNumber.count == 13 {
            delegate?.sentNewNumber(number: phoneNumber)
        } else {
            delegate?.errorNewNumber()
        }
        return false
    }
    
    func textField(
        _ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String
    ) -> Bool {
        return formatPhoneNumber(textField, range: range, replacementString: string)
    }
    

    
}

