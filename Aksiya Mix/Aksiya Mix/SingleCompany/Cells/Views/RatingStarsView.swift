//
//  RatingStarsView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 09/03/24.
//

import UIKit

class RatingStarsView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
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
        for i in 1...5 {
            let star = UIImageView()
            star.image = .rating
            mainStack.addArrangedSubview(star)
            star.snp.makeConstraints { make in
                make.width.height.equalTo(16)
            }
        }
        addSubview(mainStack)
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
