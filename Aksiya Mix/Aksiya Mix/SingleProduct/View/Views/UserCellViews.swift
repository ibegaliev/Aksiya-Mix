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
    
    lazy var textView: UILabel = {
        let lbl = UILabel()
        lbl.text = "Это отличный телефон. Я рекомендую это всем. Дешево и качественно. Доставили быстро ко мне домой. Я рад."
        lbl.numberOfLines = 0
        lbl.textColor = .spacetext
        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
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
        backgroundColor = .white
        
        addSubview(stack)
        
        [mainStack, textView].forEach { item in
            stack.addArrangedSubview(item)
        }
        
        [mainImage, labelsStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [nameLabel, seenLabel].forEach { item in
            labelsStack.addArrangedSubview(item)
        }
        
        mainImage.layer.cornerRadius = 10
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
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
        stack.axis = .horizontal
        stack.alignment = .leading
        return stack
    }()
    
    lazy var headerStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 2
        stack.axis = .vertical
        stack.alignment = .leading
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 14, weight: .semibold)
        lbl.text = "Комментарии"
        return lbl
    }()
    
    lazy var countLabel: UIView = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 10, weight: .medium)
        lbl.text = "26 тыс."
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
        img.image = .user02
        img.contentMode = .center
        img.tintColor = .spaceField
        img.backgroundColor = .white
        img.layer.borderColor = UIColor.spaceField.cgColor
        img.layer.borderWidth = 1
        return img
    }()
    
    lazy var textFieldView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.spaceField.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .appFont(ofSize: 12, weight: .medium)
        textField.placeholder = LyricsManager.getLyrics(type: .enterComment)
        return textField
    }()
    
    lazy var showAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("Hammasi", for: .normal)
        button.setTitleColor(.selectBlue, for: .normal)
        button.titleLabel?.font = .appFont(ofSize: 12, weight: .semibold)
        return button
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
        
        [headerStack, showAllButton].forEach { item in
            titleStack.addArrangedSubview(item)
        }
        
        [titleLabel, countLabel].forEach { item in
            headerStack.addArrangedSubview(item)
        }
        
        [icon, textFieldView].forEach { item in
            textFieldStack.addArrangedSubview(item)
        }
        
        icon.layer.cornerRadius = 16
        
        backgroundColor = .backColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(16)
        }
        textFieldView.snp.makeConstraints { make in
            make.height.equalTo(36.toScreen)
        }
        textField.snp.makeConstraints { make in
            make.edges.equalTo(textFieldView).inset(7)
        }
        icon.snp.makeConstraints { make in
            make.width.height.equalTo(32.toScreen)
        }
    }
    
}
