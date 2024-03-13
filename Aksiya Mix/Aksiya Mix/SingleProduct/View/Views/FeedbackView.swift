//
//  FeedbackView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

class FeedbackView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 20
        return stack
    }()
    
    lazy var item: FeedbackItemsView = {
        let view = FeedbackItemsView()
        
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
    
}
