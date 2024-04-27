//
//  UploadImageMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 12/04/24.
//

import UIKit

protocol UploadImageMarketCellDelegate {
    func imageSelectTapped()
    func nameUZ(text: String?)
    func nameRU(text: String?)
    func shortName(text: String?)
}

final class UploadImageMarketCell: UITableViewCell, UITextFieldDelegate {
    
    var delegate: UploadImageMarketCellDelegate?
    
    lazy var selectableImageView: UIImageView = {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectImageTapped))
        let image = UIImageView()
        image.image = .storefront
        image.tintColor = UIColor.spacetext
        image.contentMode = .center
        image.layer.cornerRadius = 35.toScreen
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.spacetext.cgColor
        image.layer.borderWidth = 2
        image.addGestureRecognizer(gesture)
        image.isUserInteractionEnabled = true
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        lbl.text = "5 MB gacha (ipg, jpeg, png, svg) kvadrat shaklidagi rasm yuklash tavsiya etiladi"
        return lbl
    }()
    
    lazy var nameOfStoreUz: ProfileEditItemView = {
        let field = ProfileEditItemView()
        field.placeholder = "Do'kon nomi (UZ)"
        field.textField.delegate = self
        return field
    }()
    
    lazy var nameOfStoreRu: ProfileEditItemView = {
        let field = ProfileEditItemView()
        field.placeholder = "Do'kon nomi (RU)"
        field.textField.delegate = self
        return field
    }()


    lazy var shortNameOfStoreOwner: ProfileEditItemView = {
        let field = ProfileEditItemView()
        field.placeholder = "Do'konning qisqacha nomi"
        field.textField.delegate = self
        return field
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 12
        stack.axis = .vertical
        return stack
    }()

    lazy var topStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 12
        stack.axis = .horizontal
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.backgroundColor = .backColor
        contentView.addSubview(mainStack)
        [topStack, nameOfStoreUz, nameOfStoreRu, shortNameOfStoreOwner].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [selectableImageView, descriptionLabel].forEach { item in
            topStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView).inset(16)
        }
        selectableImageView.snp.makeConstraints { make in
            make.width.height.equalTo(70.toScreen)
        }
    }
    
    @objc
    func selectImageTapped() {
        delegate?.imageSelectTapped()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if textField == nameOfStoreUz.textField {
            delegate?.nameUZ(text: newText)
        } else if textField == nameOfStoreRu.textField {
            delegate?.nameRU(text: newText)
        } else if textField == shortNameOfStoreOwner.textField {
            delegate?.shortName(text: newText)
        }
        return true
    }
    
}
