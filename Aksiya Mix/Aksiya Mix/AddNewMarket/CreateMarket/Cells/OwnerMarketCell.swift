//
//  OwnerMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 12/04/24.
//

import UIKit

protocol OwnerMarketCellDelegate {
    func changeNameField(text: String)
    func changeSurnameField(text: String)
    func changeMidnameField(text: String)
}

class OwnerMarketCell: UITableViewCell {
    
    var delegate: OwnerMarketCellDelegate?
    
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

        }
    }
    
    var number: String? {
        get {
            return nil
        }
        set {
            numberLabel.text = newValue
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var nametextField: ProfileEditItemView = {
        let field = ProfileEditItemView()
        field.textField.delegate = self
        field.placeholder = "Ism"
        return field
    }()

    lazy var surnametextField: ProfileEditItemView = {
        let field = ProfileEditItemView()
        field.textField.delegate = self
        field.placeholder = "Familiya"
        return field
    }()

    lazy var midnametextField: ProfileEditItemView = {
        let field = ProfileEditItemView()
        field.textField.delegate = self
        field.placeholder = "Sharfi"
        return field
    }()

    lazy var numberLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 12, weight: .medium)
        return lbl
    }()
    
    lazy var numberIcon: UIImageView = {
        let image = UIImageView()
        image.image = .call
        return image
    }()

    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    lazy var bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
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
        [titleLabel, nametextField, surnametextField, midnametextField, bottomStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [numberIcon, numberLabel].forEach { item in
            bottomStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(12)
            make.bottom.equalTo(contentView)
            make.left.right.equalTo(contentView).inset(16)
        }
        numberIcon.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
    }
    
}

extension OwnerMarketCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if textField == nametextField.textField {
            delegate?.changeNameField(text: newText)
        } else if textField == surnametextField.textField {
            delegate?.changeSurnameField(text: newText)
        } else if textField == midnametextField.textField {
            delegate?.changeMidnameField(text: newText)
        }
        return true
    }
    
}
