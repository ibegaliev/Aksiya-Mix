//
//  UserCellViews.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/2/24.
//

import UIKit

class UserHeaderView: UIView {
    
    lazy var mainImage: UIImageView = {
        let img = UIImageView()
        img.image = .personImagee
        return img
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.text = "Topilov Asadbek"
        return lbl
    }()
    
    lazy var seenLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 10)
        lbl.text = "30 минут назад"
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    lazy var labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
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
        addSubview(mainStack)
                
        [mainImage, labelsStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [nameLabel, seenLabel].forEach { item in
            labelsStack.addArrangedSubview(item)
        }
        
        mainImage.layer.cornerRadius = 10
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        mainImage.snp.makeConstraints { make in
            make.width.height.equalTo(40.toScreen)
        }
    }
    
}

class UserCommentView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    
    lazy var titleStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 2
        stack.alignment = .leading
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 12)
        lbl.text = "Комментарии"
        return lbl
    }()
    
    lazy var countLabel: UIView = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12)
        lbl.text = "(26)"
        return lbl
    }()
    
    
    lazy var textFieldStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    lazy var icon: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .commentImageBack
        return img
    }()
    
    lazy var textFieldView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = .spaceField
        return view
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 10)
        textField.placeholder = "Введите комментарий"
        textField.tintColor = .spacetext
        return textField
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
        
        addSubview(mainStack)
        
        textFieldView.addSubview(textField)
        
        [titleStack, textFieldStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [titleLabel, countLabel].forEach { item in
            titleStack.addArrangedSubview(item)
        }
        
        [icon, textFieldView].forEach { item in
            textFieldStack.addArrangedSubview(item)
        }
        
        backgroundColor = .spaceBack
        layer.cornerRadius = 8
        icon.layer.cornerRadius = 12
        clipsToBounds = true
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(16)
        }
        textFieldView.snp.makeConstraints { make in
            make.height.equalTo(32)
        }
        textField.snp.makeConstraints { make in
            make.edges.equalTo(textFieldView).inset(7)
        }
        icon.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
    }
    
}
