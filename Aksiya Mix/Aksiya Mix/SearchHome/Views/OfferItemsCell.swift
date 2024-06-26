//
//  OfferItemsCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 06/04/24.
//

import UIKit

class OfferItemCell: UITableViewCell {
    
//    var cellData: String? {
//        get {
//            return nil
//        }
//        set {
//            guard let newValue else { return }
//            titleLabel.text = newValue
//        }
//    }
    
    var cellType: UserCellType? {
        get {
            return nil
        }
        set {
            switch newValue {
                case .top:
                    backView.layer.cornerRadius = 10
                    backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                case .bottom:
                    backView.layer.cornerRadius = 10
                    backView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
                case .center:
                    backView.layer.cornerRadius = 0
                case nil:
                    backView.layer.cornerRadius = 0
            }
        }
    }
    
    lazy var backView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .medium)
        return lbl
    }()
    
    lazy var rightIcon: UIImageView = {
        let ic = UIImageView()
        ic.image = .chevronRight
        return ic
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .spaceLine
        return view
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
        [titleLabel].forEach { item in
            leftStack.addArrangedSubview(item)
        }
        contentView.addSubview(lineView)
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView)
            make.left.right.equalTo(contentView).inset(16)
        }
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(backView).inset(12)
        }
        rightIcon.snp.makeConstraints { make in
            make.width.height.equalTo(18)
        }
        lineView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(28)
            make.bottom.equalTo(contentView)
            make.height.equalTo(1)
        }
    }
    
}

