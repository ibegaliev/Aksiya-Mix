//
//  FeedbackItemsView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/1/24.
//

import UIKit

protocol FeedbackItemsViewDelegate {
    func liked()
    func disliked()
}

class FeedbackItemsView: UIView, FeedbackButtonDelegate {
    
    var delegate: FeedbackItemsViewDelegate?
    
    lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .spaceLine
        return line
    }()
        
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = -4
        stack.axis = .horizontal
        stack.alignment = .center
        return stack
    }()
    
    lazy var likeButton: FeedbackButton = {
        let btn = FeedbackButton()
        btn.image = .thumbUp
        btn.delegate = self
        return btn
    }()
    
    lazy var dislikeButton: FeedbackButton = {
        let btn = FeedbackButton()
        btn.image = .thumbDown
        btn.delegate = self
        return btn
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
        
        [likeButton, lineView, dislikeButton].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        backgroundColor = .backColor
        layer.cornerRadius = 8
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.right.equalTo(self)
        }
        lineView.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(16)
        }
    }
    
    func tappedFeedback(view: UIView) {
        if view == likeButton {
            delegate?.liked()
        }
        if view == dislikeButton {
            delegate?.disliked()
        }
    }
    
}
