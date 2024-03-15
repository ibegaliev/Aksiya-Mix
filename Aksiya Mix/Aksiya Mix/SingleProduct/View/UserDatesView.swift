//
//  UserDatesView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/2/24.
//

import UIKit

class UserDatesCell: UITableViewCell {
    
    lazy var personView: UserHeaderView = {
        let view = UserHeaderView()
        
        return view
    }()
        
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    lazy var commentView: UserCommentView = {
        let view = UserCommentView()
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {

        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        backgroundColor = .backColor
        contentView.backgroundColor = .white
        contentView.addSubview(mainStack)
        
        [personView, commentView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.bottom.equalTo(contentView).inset(12)
        }
    }
    
}
