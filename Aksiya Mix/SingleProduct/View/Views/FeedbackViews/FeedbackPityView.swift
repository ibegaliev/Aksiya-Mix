//
//  FeedbackPityView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/1/24.
//

import UIKit

class FeedbackPityView: UIView {

    lazy var button: FeedbackButton = {
        let btn = FeedbackButton()
        btn.title = "Жалоба"
        btn.image = .alertTriangle
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
        
        backgroundColor = .backColor
        layer.cornerRadius = 8
        
        addSubview(button)
    }
    
    private func setConstraints() {
        button.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
