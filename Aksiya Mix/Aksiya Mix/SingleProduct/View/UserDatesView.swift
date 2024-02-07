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
    
    lazy var textStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .trailing
        return stack
    }()
    
    lazy var textView: UILabel = {
        let lbl = UILabel()
        lbl.text = "Это отличный телефон. Я рекомендую это всем. Дешево и качественно. Доставили быстро ко мне домой. Я рад"
        lbl.numberOfLines = 0
        lbl.textColor = .spacetext
        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    
    lazy var showText: UIButton = {
        let btn = UIButton()
        btn.setTitle("Все", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.setTitleColor(.selectBlue, for: .normal)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    lazy var commentView: UIView = {
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
        
        contentView.addSubview(mainStack)
        
        [personView, textStack, commentView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [textView, showText].forEach { item in
            textStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.bottom.equalTo(contentView).inset(12)
        }
    }
    
}
