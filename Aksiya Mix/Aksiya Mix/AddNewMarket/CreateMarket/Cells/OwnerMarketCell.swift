//
//  OwnerMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 12/04/24.
//

import UIKit

class OwnerMarketCell: UITableViewCell {
    
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
            textField.placeholder = newValue
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
    
    lazy var textField: ProfileEditItemView = {
        let field = ProfileEditItemView()
        field.placeholder = "SOME TEXT HERE!"
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
        [titleLabel, textField, bottomStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [numberIcon, numberLabel].forEach { item in
            bottomStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView).inset(16)
        }
        numberIcon.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
    }
    
}
