//
//  CompanyHeaderCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/03/24.
//

import UIKit

class CompanyHeaderCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = false
        return view
    }()
    
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.image = .broIcon
        image.clipsToBounds = true
        image.layer.cornerRadius = 40.toScreen
        image.layer.borderColor = UIColor.red.cgColor
        image.layer.borderWidth = 1.5
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Korzinka MCHJ"
        lbl.font = .appFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    lazy var verifyIcon: UIImageView = {
        let view = UIImageView()
        view.image = .checkVerified
        view.tintColor = .selectBlue
        return view
    }()
    
    lazy var usernameLabel: UILabel = {
        let lbl = UILabel()
        lbl.layer.cornerRadius = 4
        lbl.clipsToBounds = true
        lbl.text = "@korzinka_uz"
        lbl.textAlignment = .center
        lbl.textColor = .selectBlue
        lbl.backgroundColor = .backColor
        lbl.font = .appFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fill
        stack.alignment = .bottom
        return stack
    }()

    lazy var titlesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fill
        stack.alignment = .leading
        return stack
    }()
    
    lazy var verifyStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.alignment = .center
        stack.distribution = .fill
        stack.axis = .horizontal
        return stack
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
        
        selectionStyle = .none
        contentView.backgroundColor = .clear
        
        backView.clipsToBounds = false
        backView.layer.cornerRadius = 8
        backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        contentView.addSubview(backView)
        
        backView.addSubview(mainStack)
        
        [mainImage, titlesStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [verifyStack, usernameLabel].forEach { item in
            titlesStack.addArrangedSubview(item)
        }
        
        [titleLabel, verifyIcon].forEach { item in
            verifyStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(0.screenWight/1.7 - 20)
            make.leading.right.equalTo(contentView)
            make.bottom.equalTo(contentView)
        }
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(backView).inset(-25)
            make.left.right.bottom.equalTo(backView).inset(16)
        }
        mainImage.snp.makeConstraints { make in
            make.width.height.equalTo(80.toScreen)
        }
        verifyIcon.snp.makeConstraints { make in
            make.width.height.equalTo(16)
        }
        usernameLabel.snp.makeConstraints { make in
            make.width.equalTo(
                14 + (usernameLabel.text?.widthOfString(usingFont: .appFont(ofSize: 12, weight: .regular)) ?? 0)
            )
            make.height.equalTo(
                6 + (usernameLabel.text?.heightOfString(usingFont: .appFont(ofSize: 12, weight: .regular)) ?? 0)
            )
        }
    }
    
}
