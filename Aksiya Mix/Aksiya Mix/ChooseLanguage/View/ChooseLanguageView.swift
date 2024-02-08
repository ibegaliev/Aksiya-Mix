//
//  ChooseLanguageView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

protocol ChooseLanguageViewDelegate {
    func confirmTapped()
}

struct LanguageDM {
    var langName: String
    var isSelect: Bool
}

class ChooseLanguageView: UIView, LanguageButtonDelegate {
    
    var delegate: ChooseLanguageViewDelegate?
        
    var langData:[LanguageDM] = [
        LanguageDM(langName: "O’zbekcha", isSelect: false),
        LanguageDM(langName: "Русский", isSelect: false)
    ]
    
    lazy var mainLogo: UIImageView = {
        let image = UIImageView()
        image.image = .appicon
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = LyricsManager.getLyrics(type: .selectLang)
        return lbl
    }()
    
    lazy var uzbButton: LanguageButton = {
        let btn = LanguageButton()
        btn.tag = 0
        btn.title = langData[0].langName
        btn.isSelected = langData[0].isSelect
        btn.delegate = self
        return btn
    }()
    
    lazy var ruButton: LanguageButton = {
        let btn = LanguageButton()
        btn.tag = 1
        btn.title = langData[1].langName
        btn.isSelected = langData[1].isSelect
        btn.delegate = self
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
    
    lazy var bottomButton: BlueButton = {
        let btn = BlueButton()
        btn.isHidden = true
        btn.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        btn.setTitle(LyricsManager.getLyrics(type: .confirmation), for: .normal)
        return btn
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
        addSubview(bottomButton)
        
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
        
        bottomButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.left.right.equalTo(self).inset(24)
            make.bottom.equalTo(self).inset(54)
        }
    }
    
    func selected(index: Int) {
        if index == 0 { LanguageManager().setLanguage(lang: .uz) }
        if index == 1 { LanguageManager().setLanguage(lang: .ru) }
        bottomButton.isHidden = false
        
        for l in langData.enumerated() {
            langData[l.offset].isSelect = false
        }
        langData[index].isSelect = true
        reloadButtons()
    }
    
    private func reloadButtons() {
        bottomButton.setTitle(LyricsManager.getLyrics(type: .confirmation), for: .normal)
        titleLabel.text = LyricsManager.getLyrics(type: .selectLang)
        uzbButton.isSelected = langData[0].isSelect
        ruButton.isSelected = langData[1].isSelect
    }
    
    @objc
    func confirmButtonTapped() {
        delegate?.confirmTapped()
    }
    
}
