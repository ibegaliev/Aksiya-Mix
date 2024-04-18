//
//  UploadImageMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 12/04/24.
//

import UIKit

final class UploadImageMarketCell: UITableViewCell {
    
    lazy var selectableImageView: UIImageView = {
        let image = UIImageView()
        image.image = .storefront
        image.tintColor = UIColor.spacetext
        image.contentMode = .center
        image.layer.cornerRadius = 35.toScreen
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.spacetext.cgColor
        image.layer.borderWidth = 2
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        lbl.text = "5 MB gacha (ipg, jpeg, png, svg) kvadrat shaklidagi rasm yuklash tavsiya etiladi"
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 12
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        contentView.backgroundColor = .backColor
        contentView.addSubview(mainStack)
        [selectableImageView, descriptionLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView).inset(16)
        }
        selectableImageView.snp.makeConstraints { make in
            make.width.height.equalTo(70.toScreen)
        }
    }
    
}
