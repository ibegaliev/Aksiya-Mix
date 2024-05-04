//
//  FeedbackView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

protocol FeedbackViewDelegate {
    func liked()
    func disliked()
}

class FeedbackView: UIView, FeedbackItemsViewDelegate {
    
    var delegate: FeedbackViewDelegate?
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .vertical
        return stack
    }()
    
    lazy var item: FeedbackItemsView = {
        let view = FeedbackItemsView()
        view.delegate = self
        return view
    }()
    
    lazy var pityView: FeedbackPityView = {
        let view = FeedbackPityView()
        
        return view
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
        
//        [item, pityView].forEach { item in
        [item].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    func liked() {
        delegate?.liked()
    }
    
    func disliked() {
        delegate?.disliked()
    }
    
}
