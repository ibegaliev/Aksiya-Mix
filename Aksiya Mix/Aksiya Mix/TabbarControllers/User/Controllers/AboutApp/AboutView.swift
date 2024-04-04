//
//  AboutView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 04/04/24.
//

import UIKit

protocol AboutViewDelegate {
    func backTapped()
}

class AboutView: UIView {
    
    var delegate: AboutViewDelegate?
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .backColor
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner
        ]
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 12
        stack.axis = .vertical
        return stack
    }()
    
    lazy var textView: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = .appFont(ofSize: 12, weight: .medium)
        lbl.text = "Aksiya va chegirmalar o'tkazib yubormaslik uchun ro'yatdan o'ting va ilovadan to'liq foydalaning"
        return lbl
    }()
    
    lazy var mainButton: BlueButton = {
        let btn = BlueButton()
        btn.layer.borderWidth = 1
        btn.setTitle("Yopish", for: .normal)
        btn.layer.borderColor = UIColor.selectBlue.cgColor
        btn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        setGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
        backgroundColor = .backClear
        
        addSubview(backView)
        backView.addSubview(mainStack)
        [textView, mainButton].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
        }
        mainStack.snp.makeConstraints { make in
            make.top.left.right.equalTo(backView).inset(16)
            make.bottom.equalTo(backView).inset(24)
        }
    }
    
    private func setGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        addGestureRecognizer(gesture)
        isUserInteractionEnabled = true
    }
    
    @objc
    func dismiss() {
        delegate?.backTapped()
    }
    
}
