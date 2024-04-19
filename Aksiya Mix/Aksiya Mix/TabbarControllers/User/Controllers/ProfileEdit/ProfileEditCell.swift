//
//  ProfileEditCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import UIKit

class ProfileEditCell: UITableViewCell {
    
    var title: ProfileEditDM? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue?.title
            switch newValue?.type {
                case .name:
                    itemView.placeholder = "Ism"
                    itemView.placeholder = newValue?.placeholder
                    itemView.isHidden = false
                    itemSelectableView.isHidden = true
                case .bornData:
                    itemSelectableView.placeholder = "01.01.1991"
                    itemSelectableView.placeholder = newValue?.placeholder
                    itemView.isHidden = true
                    itemSelectableView.isHidden = false
                case .sex:
                    itemSelectableView.placeholder = "Tanlang"
                    itemSelectableView.placeholder = newValue?.placeholder
                    itemView.isHidden = true
                    itemSelectableView.isHidden = false
                case .region:
                    itemSelectableView.placeholder = "Tanlang"
                    itemSelectableView.placeholder = newValue?.placeholder
                    itemView.isHidden = true
                    itemSelectableView.isHidden = false
                case .fok:
                    itemSelectableView.placeholder = "Tanlang"
                    itemSelectableView.placeholder = newValue?.placeholder
                    itemView.isHidden = true
                    itemSelectableView.isHidden = false
                case .numberPhone:
                    itemView
                    itemView.placeholder = "+998 "
                    itemView.placeholder = newValue?.placeholder
                    itemView.isHidden = false
                    itemSelectableView.isHidden = true
                case .email:
                    itemView.placeholder = "e-mail"
                    itemView.placeholder = newValue?.placeholder
                    itemView.isHidden = false
                    itemSelectableView.isHidden = true
                case nil:
                    break
            }

        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 14, weight: .semibold)
        return lbl
    }()
    
    lazy var itemView: ProfileEditItemView = {
        let view = ProfileEditItemView()
        
        return view
    }()
    
    lazy var itemSelectableView: ProfileEditItemSelectableView = {
        let view = ProfileEditItemSelectableView()
        
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
        [titleLabel, itemView, itemSelectableView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView).inset(16)
        }
    }
    
}

class ProfileEditItemSelectableView: UIView {
    
    var placeholder: String? {
        get {
            return nil
        }
        set {
            label.text = newValue
        }
    }
    
    lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .placeholderText
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        return lbl
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
        
        addSubview(label)
    }
    
    private func setConstraints() {
        label.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.right.equalTo(self).inset(8)
            make.height.equalTo(44.toScreen)
        }
    }
    
}
 
class ProfileEditItemView: UIView {
    
    var placeholder: String? {
        get {
            return nil
        }
        set {
            textField.placeholder = newValue
        }
    }

    private lazy var textField: UITextField = {
        let field = UITextField()
        field.font = .appFont(ofSize: 14, weight: .medium)
        return field
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
        addSubview(textField)
    }
        
    private func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.right.equalTo(self).inset(8)
            make.height.equalTo(44.toScreen)
        }
    }
    
}
