//
//  ProvinceMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/04/24.
//

import UIKit

class ProvinceMarketCell: UITableViewCell {
    
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
            textField.setTitle(newValue, for: .normal)
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var textField: UIButton = {
        let field = UIButton()
        field.clipsToBounds = true
        field.layer.cornerRadius = 8
        field.backgroundColor = .white
        field.titleLabel?.textAlignment = .left
        field.setTitleColor(.placeholderText, for: .normal)
        field.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
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
        [titleLabel, textField].forEach { item in
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
    
}

