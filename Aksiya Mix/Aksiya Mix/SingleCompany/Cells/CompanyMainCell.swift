//
//  CompanyMainCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class CompanyMainCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 16
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    lazy var mainButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitle("Подписаться", for: .normal)
        return btn
    }()
    
    lazy var bottomTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .spacetext
        lbl.textAlignment = .center
//        lbl.text = "На aksiyamix с март 2018 г."
        lbl.font = .appFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
        contentView.backgroundColor = .backColor
        
        contentView.addSubview(backView)
        
        backView.addSubview(mainStack)
        [mainButton, bottomTitle].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView).inset(4)
            make.top.left.right.equalTo(contentView)
        }
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(backView).inset(16)
        }
    }
    
}
