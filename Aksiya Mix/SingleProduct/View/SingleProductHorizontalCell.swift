//
//  SingleProductHorizontalCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/2/24.
//

import UIKit

class SingleProductHorizontalCell: UITableViewCell {
    
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.image = .imageDelete
        return image
    }()
    
    lazy var likeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(.heart, for: .normal)
        return btn
    }()
    
    lazy var newPrince: UILabel = {
        let lbl = UILabel()
        lbl.text = "17 000 000 сум"
        lbl.font = .boldSystemFont(ofSize: 12)
        return lbl
    }()

    lazy var oldPrince: UILabel = {
        let lbl = UILabel()
        lbl.text = "17 000 000 сум"
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(
            string: "18 5000 000 сум"
        )
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: 1.5,
            range: NSRange(
                location: 0,
                length: attributeString.length
            )
        )
        lbl.attributedText = attributeString
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Смартфон Apple iPhone 13 pro 256ГБ "
        lbl.font = .boldSystemFont(ofSize: 12)
        return lbl
    }()
    
    lazy var storeView: StoreView = {
        let view = StoreView()
        
        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    lazy var titlesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    lazy var princeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    lazy var rightCornerImage: UIImageView = {
        let image = UIImageView()
        image.image = .saleIcon
        return image
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
        contentView.backgroundColor = .white
        
        contentView.addSubview(mainStack)
        
        [mainImage, titlesStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [princeStack, titleLabel, storeView].forEach { item in
            titlesStack.addArrangedSubview(item)
        }
        
        [newPrince, oldPrince].forEach { item in
            princeStack.addArrangedSubview(item)
        }
        
        mainImage.addSubview(likeButton)
        contentView.addSubview(rightCornerImage)
    }
    
    private func setConstraints() {
        
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(6)
            make.left.right.equalTo(contentView).inset(16)
        }
        
        mainImage.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(100)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.right.equalTo(mainImage).inset(4)
            make.width.height.equalTo(24)
        }
        
        rightCornerImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(8)
            make.right.equalTo(contentView).inset(16)
            make.width.height.equalTo(24)
        }
        
    }
    
}

class StoreView: UIView {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = .broooIcon
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Bro"
        lbl.font = .boldSystemFont(ofSize: 12)
        lbl.textColor = .spacetext
        return lbl
    }()
        
    lazy var starImage: UIImageView = {
        let image = UIImageView()
        image.image = .rating
        return image
    }()
    
    lazy var descrip: UILabel = {
        let lbl = UILabel()
        lbl.text = "(44)"
        lbl.font = .systemFont(ofSize: 8)
        lbl.textColor = .spacetext
        return lbl
    }()

    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()
    
    lazy var rightStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        return stack
    }()
    
    lazy var starStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        return stack
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
        
        [image, rightStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [titleLabel, starStack].forEach { item in
            rightStack.addArrangedSubview(item)
        }
        
        [starImage, descrip].forEach { item in
            starStack.addArrangedSubview(item)
        }
        
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        image.snp.makeConstraints { make in
            make.height.width.equalTo(32)
        }
        starImage.snp.makeConstraints { make in
            make.width.height.equalTo(12)
        }
        
    }
    
}
