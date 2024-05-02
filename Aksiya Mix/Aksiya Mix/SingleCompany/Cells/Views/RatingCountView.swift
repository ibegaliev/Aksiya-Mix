//
//  RatingCountView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 09/03/24.
//

import UIKit

class RatingCountView: UIView {
    
    lazy var mainCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "4.9"
        lbl.font = .appFont(ofSize: 44, weight: .bold)
        return lbl
    }()
    
    lazy var starsView: RatingStarsView = {
        let view = RatingStarsView()

        return view
    }()
    
    lazy var counsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "3ta baho"
        lbl.font = .appFont(ofSize: 12, weight: .regular)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fill
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
        [mainCount, starsView, counsLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}
