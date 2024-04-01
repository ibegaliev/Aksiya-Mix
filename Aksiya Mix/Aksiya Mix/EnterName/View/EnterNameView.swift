//
//  EnterNameView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

protocol EnterNameViewDelegate {
    func nextTapped(name: String?)
}

class EnterNameView: UIView {
    
    var delegate: EnterNameViewDelegate?
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 24, weight: .semibold)
        lbl.text = LyricsManager.getLyrics(type: .enterName)
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .regular)
        lbl.text = LyricsManager.getLyrics(type: .enterNameDescription)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var inputFieldView: InputFieldView = {
        let view = InputFieldView()
        
        return view
    }()
    
    lazy var sentCode: BlueButton = {
        let btn = BlueButton()
        btn.setTitle(LyricsManager.getLyrics(type: .getCode), for: .normal)
        btn.addTarget(self, action: #selector(sentTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 86.toScreen
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    
    lazy var topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    lazy var bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
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
        
        addSubview(mainStack)
        
        [topStack, bottomStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [titleLabel, descriptionLabel].forEach { item in
            topStack.addArrangedSubview(item)
        }
        
        [inputFieldView, sentCode].forEach { item in
            bottomStack.addArrangedSubview(item)
        }

    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self).inset(116.toScreen)
            make.left.right.equalTo(self).inset(24)
        }
    }
    
    @objc
    func sentTapped() {
        delegate?.nextTapped(name: inputFieldView.inputField.text)
    }
    
}
