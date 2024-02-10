//
//  Cell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 10/02/24.
//

import UIKit

class CompanyCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var mainImage: UIImageView = {
        let img = UIImageView()
        img.image = .figmaIcon
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Apple Bro"
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "22k  Подписаться"
        lbl.font = .appFont(ofSize: 12, weight: .regular)
        lbl.textColor = .spacetext 
        return lbl
    }()
    
    lazy var mainButton: BlueButton = {
        let btn = BlueButton()
        btn.titleLabel?.font = .appFont(ofSize: 12, weight: .medium)
        btn.setTitle("Подписаться", for: .normal)
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center
        return stack
    }()

    lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    lazy var titleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        return stack
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
        contentView.backgroundColor = .backColor
        contentView.addSubview(backView)
        
        contentView.addSubview(mainStack)
        [leftStack, mainButton].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [mainImage, titleStack].forEach { item in
            leftStack.addArrangedSubview(item)
        }
        [titleLabel, descriptionLabel].forEach { item in
            titleStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView)
        }
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView).inset(16)
        }
        mainImage.snp.makeConstraints { make in
            make.width.height.equalTo(64.toScreen)
        }
        mainButton.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(104)
        }
    }
    
}
