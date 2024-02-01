//
//  FeedbackItemsView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/1/24.
//

import UIKit

class FeedbackItemsView: UIView {
        
    lazy var lineView: UIView = {
        let line = UIView()
        
        return line
    }()
        
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .horizontal
        stack.alignment = .fill
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
        addSubview(mainStack)
        
//        [leftView, lineView, rightView].forEach { item in
//            mainStack.addArrangedSubview(item)
//        }
        
        backgroundColor = .backColor
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.right.equalTo(self).inset(12)
        }
    }
    
}
