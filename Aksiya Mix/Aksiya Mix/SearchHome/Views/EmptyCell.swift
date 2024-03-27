//
//  EmptyCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 27/03/24.
//

import UIKit

class EmptyCell: UITableViewCell {
    
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.image = .searchMd
        
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text, Some text"
        lbl.font = .appFont(ofSize: 14, weight: .medium)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.spacing = 12
        stack.axis = .vertical
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
        backgroundColor = .backColor
        addSubview(mainStack)
        [mainImage, titleLabel].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        mainImage.snp.makeConstraints { make in
            make.width.height.equalTo(75.toScreen)
        }
    }
    
}
