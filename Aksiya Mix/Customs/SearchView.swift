//
//  SearchView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit
import SnapKit

protocol SearchViewDelegate {
    
    func backButtonTapped()
    func notificationTapped()
    func optionsTapped()
    
    func textFieldDidBeginEditing(textField: UITextField)
    func textFieldDidEndEditing(_ textField: UITextField)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
}

class SearchView: UIView, SearchTextFieldDelegate {
    
    var delegate: SearchViewDelegate?
    
    var mode: BaseMode? {
        get {
            return .home
        }
        set {
            guard let newValue else { return }
            switch newValue {
                case .home:
                    mainStack.spacing = 8
                    rightButton.isHidden = false
                    [closeButton, optionsButton].forEach { item in
                        item.isHidden = true
                    }
                case .search:
                    clipsToBounds = true
                    layer.cornerRadius = 8
                    layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
                    mainStack.spacing = 16
                    rightButton.isHidden = true
                    [closeButton, optionsButton].forEach { item in
                        item.isHidden = false
                    }
                    textField.tf.becomeFirstResponder()
                case .option:
                    clipsToBounds = true
                    layer.cornerRadius = 8
                    layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
                    mainStack.spacing = 8
                    [closeButton, rightButton].forEach { item in
                        item.isHidden = true
                    }
            }
        }
    }
    
    lazy private var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fill
        stack.axis = .horizontal
        return stack
    }()
    
    lazy private var textField: SearchTextField = {
        let tf = SearchTextField()
        tf.delegate = self
        return tf
    }()
    
    lazy var rightButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.navigation_bell, for: .normal)
        btn.addTarget(self, action: #selector(notificationTapped), for: .touchUpInside)
        return btn
    }()

    lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        btn.setImage(UIImage.arrowleftBlack, for: .normal)
        return btn
    }()

    lazy var optionsButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.sliders, for: .normal)
        btn.addTarget(self, action: #selector(optionsTapped), for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
                
        backgroundColor = .white
        addSubview(mainStack)
        
        [closeButton, textField, optionsButton, rightButton].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self).inset(16)
        }
        [closeButton, optionsButton, rightButton].forEach { item in
            item.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
        }
    }
    
    @objc
    func backTapped() {
        delegate?.backButtonTapped()
    }

    @objc
    func notificationTapped() {
        delegate?.backButtonTapped()
    }

    @objc
    func optionsTapped() {
        delegate?.backButtonTapped()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        delegate?.textFieldDidBeginEditing(textField: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing(textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) {
        delegate?.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
    }

    
}

protocol SearchTextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField)
    func textFieldDidEndEditing(_ textField: UITextField)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
}

class SearchTextField: UIView, UITextFieldDelegate {
    
    var delegate: SearchTextFieldDelegate?
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        return stack
    }()
    
    lazy private var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .navigation_search
        return imageView
    }()
    
    lazy var tf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Поиск"
        tf.delegate = self
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backColor
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
        clipsToBounds = true
        layer.cornerRadius = 8
        backgroundColor = .backColor
        
        addSubview(stack)
        
        [icon, tf].forEach { item in
            stack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        stack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(10)
            make.left.right.equalTo(self).inset(16)
        }
        icon.snp.makeConstraints { make in
            make.width.height.equalTo(20.toScreen)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        icon.isHidden = true
        delegate?.textFieldDidBeginEditing(textField: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.35) { [self] in
            icon.isHidden = false
        }
        delegate?.textFieldDidEndEditing(textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        delegate?.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
        return true
    }
    
}
