//
//  AlertView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 21/03/24.
//

import UIKit

protocol AlertViewDelegate {
    func okTapped()
    func cancelTapped()
}

class AlertView: UIView {
    
    var delegate: AlertViewDelegate?
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .backColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "Siz haqiqatan ham tizimdan chiqmoqchimisiz?"
        lbl.numberOfLines = 0
        lbl.font = .appFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    lazy var okButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        btn.backgroundColor = .red
        btn.setTitle("Ha", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var cancelButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        btn.backgroundColor = .spacetext
        btn.setTitle("Yo'q", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
        return stack
    }()
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 12
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
        
        backgroundColor = .backClear
        
        addSubview(backView)
        backView.addSubview(mainStack)
        
        [titleLabel, buttonStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [cancelButton, okButton].forEach { item in
            buttonStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(16)
            make.center.equalTo(self)
        }
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(backView).inset(12)
        }
        okButton.snp.makeConstraints { make in
            make.height.equalTo(38.toScreen)
        }
    }
    
    @objc
    func okTapped() {
        delegate?.okTapped()
    }
    
    @objc
    func cancelTapped() {
        delegate?.cancelTapped()
    }
    
}
