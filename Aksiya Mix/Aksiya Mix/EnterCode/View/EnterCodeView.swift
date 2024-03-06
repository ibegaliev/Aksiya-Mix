//
//  EnterCodeView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

protocol EnterCodeViewDelegate {
    func sentTapped()
    func otp(otp: String)
}

class EnterCodeView: UIView, OtpFieldViewDelegate {
    
    var delegate: EnterCodeViewDelegate?
    
    var number: String? {
        get {
            return nil
        }
        set {
            guard let newValue else { return }
            descriptionLabel.text = "\(LyricsManager.getLyrics(type: .enterDescription)) \(newValue)"
        }
    }
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 24, weight: .semibold)
        lbl.text = LyricsManager.getLyrics(type: .enterCode)
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .regular)
        lbl.text = LyricsManager.getLyrics(type: .enterDescription)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var otpField: OtpFieldView = {
        let view = OtpFieldView()
        view.delegate = self
        return view
    }()
    
    lazy var returnButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(LyricsManager.getLyrics(type: .resentCode), for: .normal)
        btn.setTitleColor(.selectBlue, for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 16, weight: .regular)
        return btn
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
        stack.spacing = 32.toScreen
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    
    lazy var topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 14.toScreen
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    lazy var bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12.toScreen
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
        
        [titleLabel, descriptionLabel, otpField].forEach { item in
            topStack.addArrangedSubview(item)
        }
        
        [returnButton, sentCode].forEach { item in
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
        delegate?.sentTapped()
    }
    
    func otp(otp: String) {
        delegate?.otp(otp: otp)
    }
    
}
