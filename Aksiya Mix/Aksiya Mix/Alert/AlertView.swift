//
//  AlertView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 21/03/24.
//

import UIKit

class AlertView: UIView {
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .backColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Siz haqiqatan ham tizimdan chiqmoqchimisiz?"
        lbl.font = .appFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    lazy var okButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var cancelButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .spaceBack
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        
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
            make.height.equalTo(0.screenWight/2)
            make.center.equalTo(self)
        }
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(backView).inset(12)
        }
    }
    
}
