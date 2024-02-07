//
//  ChooseLanguageView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

class ChooseLanguageView: UIView {
    
    lazy var mainLogo: UIImageView = {
        let image = UIImageView()
        image.image = .appicon
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Выберите язык приложения"
        return lbl
    }()
    
    lazy var uzbButton: UIView = {
        let btn = LanguageButton()
        
        return btn
    }()
    
    lazy var ruButton: UIView = {
        let btn = LanguageButton()
        
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 78.toScreen
        return stack
    }()
    
    lazy var topStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 48.toScreen
        stack.alignment = .center
        stack.axis = .vertical
        return stack
    }()
    
    lazy var buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(mainStack)
        
        [topStack, buttonsStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [mainLogo, titleLabel].forEach { item in
            topStack.addArrangedSubview(item)
        }
        
        [uzbButton, ruButton].forEach { item in
            buttonsStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self).inset(112.toScreen)
            make.left.right.equalTo(self).inset(24)
        }
        mainLogo.snp.makeConstraints { make in
            make.width.height.equalTo(64.toScreen)
        }
        uzbButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(0.screenWight-48)
        }
    }
    
}
