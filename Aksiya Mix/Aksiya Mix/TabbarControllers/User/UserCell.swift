//
//  UserCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 20/02/24.
//

import UIKit

enum UserCellType {
    case top, bottom, center
}

class UserCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    lazy var iconView: UIImageView = {
        let ic = UIImageView()
        
        return ic
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Sozlamalar"
        lbl.font = .appFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    
    lazy var rightIcon: UIImageView = {
        let ic = UIImageView()
        ic.image = .chevronRight
        return ic
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
        backView.backgroundColor = .white
        contentView.backgroundColor = .backColor
        
        contentView.addSubview(backView)
        backView.addSubview(mainStack)
        
        [leftStack, rightIcon].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [iconView, titleLabel].forEach { item in
            leftStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView).inset(16)
        }
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(backView).inset(12)
        }
        iconView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        rightIcon.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
    }
    
}
