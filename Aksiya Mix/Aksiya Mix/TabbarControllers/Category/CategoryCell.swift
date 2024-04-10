//
//  CategoryCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    var data: CategoryModel? {
        get {
            return nil
        }
        set {
            if LanguageManager().getLanguage() == "uz" {
                titleLabel.text = newValue?.name_uz
            } else {
                titleLabel.text = newValue?.name_ru
            }
            mainImage.image = UIImage(named: newValue?.image ?? "")
        }
    }
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    lazy var mainImage: RoundableImageView = {
        let view = RoundableImageView()
        view.layer.cornerRadius = 30
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var chevronImage: UIImageView = {
        let img = UIImageView()
        img.image = .chevronRight
        return img
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 4
        return stack
    }()

    lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.alignment = .center
        return stack
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
        [leftStack, chevronImage].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [mainImage, titleLabel].forEach { item in
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
        
        chevronImage.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        
        mainImage.snp.makeConstraints { make in
            make.height.width.equalTo(60)
        }
        
    }
    
}
