//
//  SingleProductCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/27/24.
//

import UIKit

class SingleProductCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = .imageDelete
        return image
    }()
    
    lazy var headerView: UIView = {
        let view = HeaderView()
        
        return view
    }()
    
    lazy var bottomTitles: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(bottomTitles)
        imageView.addSubview(headerView)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 4
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.right.equalTo(self)
            make.height.equalTo(contentView.frame.width)
        }
        bottomTitles.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(imageView.snp_bottomMargin).inset(-8)
        }
        headerView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp_topMargin)
            make.left.right.equalTo(imageView)
            make.height.equalTo(24)
        }
    }
    
}

class HeaderView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()
    
    lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        return stack
    }()
    
    lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.image = .broIcon
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Mak bro"
        lbl.textColor = .white
        lbl.font = .boldSystemFont(ofSize: 10)
        return lbl
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.setImage(.heard_Icon, for: .normal)
        return btn
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
        
        [leftStack, button].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [iconView, titleLabel].forEach { item in
            leftStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.right.equalTo(self).inset(8)
        }
        iconView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        button.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
    }
    
}
