//
//  EnterPhoneView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

protocol EnterPhoneViewDelegate {
    func saveTapped(number: String?)
}

class EnterPhoneView: UIView {
    
    var delegate: EnterPhoneViewDelegate?
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 24, weight: .semibold)
        lbl.text = LyricsManager.getLyrics(type: .enterNumber)
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .regular)
        lbl.text = LyricsManager.getLyrics(type: .enterNumberDescription)
        return lbl
    }()
    
    lazy var inputTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 14, weight: .regular)
        lbl.text = LyricsManager.getLyrics(type: .phoneNumber)
        return lbl
    }()
    
    lazy var inputNumberView: InputNumberView = {
        let input = InputNumberView()
        
        return input
    }()
    
    lazy var bottomButton: BlueButton = {
        let btn = BlueButton()
        btn.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        btn.setTitle(LyricsManager.getLyrics(type: .getCode), for: .normal)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 110.toScreen
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
        stack.spacing = 16
        return stack
    }()
    
    lazy var fieldStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
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
        
        [fieldStack, bottomButton].forEach { item in
            bottomStack.addArrangedSubview(item)
        }
        
        [inputTitleLabel, inputNumberView].forEach { item in
            fieldStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self).inset(116.toScreen)
            make.left.right.equalTo(self).inset(24)
        }
    }
    
    @objc
    func saveTapped() {
        delegate?.saveTapped(number: "number")
    }
    
}
