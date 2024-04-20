//
//  ProfileEditCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import UIKit

protocol ProfileEditCellDelegate {
    func setData(data: String?, tag: Int?)
}

class ProfileEditCell: UITableViewCell, UITextFieldDelegate, ProfileEditItemSelectableViewDelegate {
    
    var delegate: ProfileEditCellDelegate?
    
    var title: ProfileEditDM? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue?.title
            switch newValue?.type {
                case .name:
                    if let placeholder = newValue?.placeholder {
                        itemView.placeholder = placeholder
                    } else {
                        itemView.placeholder = "Ism"
                    }
                    itemView.isHidden = false
                    itemSelectableView.isHidden = true
                case .bornData:
                    if let placeholder = newValue?.placeholder {
                        itemSelectableView.placeholder = placeholder
                    } else {
                        itemSelectableView.placeholder = "Tanlang"
                    }
                    itemView.isHidden = true
                    itemSelectableView.isHidden = false
                    itemSelectableView.label.isHidden = true
                case .sex:
                    itemSelectableView.birthDatePicker.isHidden = true
                    if let placeholder = newValue?.placeholder {
                        itemSelectableView.placeholder = placeholder
                    } else {
                        itemSelectableView.placeholder = "Tanlang"
                    }
                    itemView.isHidden = true
                    itemSelectableView.isHidden = false
                case .region:
                    itemSelectableView.birthDatePicker.isHidden = true
                    if let placeholder = newValue?.placeholder {
                        itemSelectableView.placeholder = placeholder
                    } else {
                        itemSelectableView.placeholder = "Tanlang"
                    }
                    itemView.isHidden = true
                    itemSelectableView.isHidden = false
                case .fok:
                    itemSelectableView.birthDatePicker.isHidden = true
                    if let placeholder = newValue?.placeholder {
                        itemSelectableView.placeholder = placeholder
                    } else {
                        itemSelectableView.placeholder = "Tanlang"
                    }
                    itemView.isHidden = true
                    itemSelectableView.isHidden = false
                case .numberPhone:
                    if let placeholder = newValue?.placeholder {
                        itemView.placeholder = placeholder
                    } else {
                        itemView.placeholder = "+998 "
                    }
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
        view.textField.delegate = self
        return view
    }()
    
    lazy var itemSelectableView: ProfileEditItemSelectableView = {
        let view = ProfileEditItemSelectableView()
        view.delegate = self
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        delegate?.setData(data: newText, tag: tag)
        return true
    }
    
    func tapped() {
        delegate?.setData(data: nil, tag: tag)
    }
    
}

protocol ProfileEditItemSelectableViewDelegate {
    func tapped()
}

class ProfileEditItemSelectableView: UIView {
    
    var delegate: ProfileEditItemSelectableViewDelegate?
    
    var placeholder: String? {
        get {
            return nil
        }
        set {
            label.setTitle(newValue, for: .normal)
        }
    }
    
    lazy var label: UIButton = {
        let lbl = UIButton()
        lbl.setTitleColor(.placeholderText, for: .normal)
        lbl.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        lbl.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return lbl
    }()
    
    lazy var birthDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        return datePicker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        tapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        clipsToBounds = true
        layer.cornerRadius = 8
        backgroundColor = .white
        
        addSubview(birthDatePicker)
        addSubview(label)
    }
    
    private func setConstraints() {
        label.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self).inset(8)
            make.height.equalTo(44.toScreen)
        }
        birthDatePicker.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self).inset(8)
            make.height.equalTo(44.toScreen)
        }
    }
    
    @objc
    func tapped() {
        let action1 = UIAction(title: "Erkak", image: nil) { [self] action in
            label.setTitle("Erkak", for: .normal)
        }
        let action2 = UIAction(title: "Ayol", image: nil) { [self] action in
            label.setTitle("Ayol", for: .normal)
        }

        if #available(iOS 15.0, *) {
            let menu = UIMenu(title: "", options: .singleSelection, children: [action1, action2])
            label.menu = menu
            label.showsMenuAsPrimaryAction = true
        } else {
            let menu = UIMenu(title: "", children: [action1, action2])
            label.menu = menu
            label.showsMenuAsPrimaryAction = true
        }
        delegate?.tapped()
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

    lazy var textField: UITextField = {
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
