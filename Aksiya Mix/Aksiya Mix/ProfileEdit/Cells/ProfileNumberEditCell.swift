//
//  ProfileNumberEditCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 20/04/24.
//

import UIKit

protocol ProfileNumberEditCellDelegate {
    func sentNewNumber(number: String?)
    func errorNewNumber()
}

class ProfileNumberEditCell: UITableViewCell, UITextFieldDelegate {
    
    var delegate: ProfileNumberEditCellDelegate?
    
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
            var number = newValue
            if newValue?.count ?? 0 > 9 {
                number?.removeFirst()
                number?.removeFirst()
                number?.removeFirst()
                number?.removeFirst()
            }
            itemView.placeholder = number
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var itemView: ProfileNumberEditItemView = {
        let view = ProfileNumberEditItemView()
        view.textField.keyboardType = .phonePad
        view.textField.delegate = self
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
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
        backgroundColor = .backColor
        
        contentView.addSubview(mainStack)
        [titleLabel, itemView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView).inset(16)
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


class ProfileNumberEditItemView: UIView {
    
    var placeholder: String? {
        get {
            return nil
        }
        set {
            textField.placeholder = newValue
        }
    }

    lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.text = "+998 "
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    lazy var textField: UITextField = {
        let field = UITextField()
        field.placeholder = "00 000 00 00"
        field.font = .appFont(ofSize: 14, weight: .medium)
        return field
    }()
    
    lazy var stack: UIStackView = {
        let st = UIStackView()
        st.alignment = .center
        return st
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
        clipsToBounds = true
        layer.cornerRadius = 8
        backgroundColor = .white
        addSubview(stack)
        [label, textField].forEach { item in
            stack.addArrangedSubview(item)
        }
    }
        
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self).inset(8)
            make.height.equalTo(44.toScreen)
        }
    }
    
}
