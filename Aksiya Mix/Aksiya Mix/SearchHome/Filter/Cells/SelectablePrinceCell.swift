//
//  SelectablePrinceCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/04/24.
//

import UIKit

class SelectablePrinceCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Narx oraliqni belgilang"
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var fromField: SelectablePrinceItem = {
        let field = SelectablePrinceItem()
        field.field.placeholder = "...dan"
        return field
    }()
    
    lazy var toField: SelectablePrinceItem = {
        let field = SelectablePrinceItem()
        field.field.placeholder = "...gacha"
        return field
    }()

    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 12
        stack.axis = .vertical
        stack.alignment = .fill
        return stack
    }()
    
    lazy var buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 6
        stack.axis = .horizontal
        stack.alignment = .fill
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
        contentView.backgroundColor = .backColor
        contentView.addSubview(mainStack)
        [titleLabel, buttonsStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [fromField, toField].forEach { item in
            buttonsStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView)
        }
        fromField.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(100)
        }
    }
    
}

class SelectablePrinceItem: UIView {
    
    lazy var field: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.font = .appFont(ofSize: 14, weight: .medium)
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
        layer.cornerRadius = 8
        clipsToBounds = true
        backgroundColor = .white
        
        addSubview(field)
    }
    
    private func setConstraints() {
        field.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(4)
            make.left.right.equalTo(self).inset(12)
        }
    }
    
}
