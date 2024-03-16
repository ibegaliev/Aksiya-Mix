//
//  CompanyInfo.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 16/03/24.
//

import UIKit

class CompanyInfo: UIView {
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .backColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    lazy var timeView: CompanyLocationItemView = {
        let view = CompanyLocationItemView()
        view.title = "Ish vaqti:"
        view.descrip = "Dush-Jum, 9:00-18:00"
        return view
    }()
    
    lazy var ratingCountView: RatingCountView = {
        let view = RatingCountView()
        view.counsLabel.isHidden = true
        view.mainCount.font = .appFont(ofSize: 22, weight: .bold)
        view.mainStack.alignment = .trailing
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
        addSubview(backView)
        backView.addSubview(mainStack)
        [timeView, ratingCountView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(backView).inset(4)
            make.left.right.equalTo(backView).inset(16)
        }
    }
    
}
