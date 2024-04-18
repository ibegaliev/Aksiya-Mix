//
//  DatedMarketCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/04/24.
//

import UIKit

class DatedMarketCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Ish vaqti:"
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var selectableView: DatesMarketItems = {
        let view = DatesMarketItems()
        
        return view
    }()
        
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
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
        [titleLabel, selectableView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(12)
            make.left.right.equalTo(contentView).inset(16)
        }
    }
    
}

class DatesMarketItems: UIView {
    
    lazy var beginData: DatedMarketItem = {
        let item = DatedMarketItem()
        item.titleLabel.text = "Dush"
        item.iconImage.isHidden = true
        return item
    }()
    
    lazy var endData: DatedMarketItem = {
        let item = DatedMarketItem()
        item.titleLabel.text = "Juma"
        item.iconImage.isHidden = true
        return item
    }()
    
    lazy var beginTime: DatedMarketItem = {
        let item = DatedMarketItem()
        item.titleLabel.text = "09:00"
        item.iconImage.isHidden = true
        return item
    }()
    
    lazy var endTime: DatedMarketItem = {
        let item = DatedMarketItem()
        item.titleLabel.text = "21:00"
        item.iconImage.isHidden = true
        return item
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.distribution = .fillEqually
        stack.alignment = .fill
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
        [beginData, endData, beginTime, endTime].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
 

class DatedMarketItem: UIView {

    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var iconImage: UIImageView = {
        let img = UIImageView()
        img.image = .chevronRight
        return img
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fill
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
        
        backgroundColor = .white
        layer.cornerRadius = 8
        
        addSubview(mainStack)
        [titleLabel, iconImage].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
        iconImage.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
    }
    
}
