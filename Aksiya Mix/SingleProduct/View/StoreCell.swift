//
//  StoreCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/2/24.
//

import UIKit

class StoreCell: UITableViewCell {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    lazy var storeView: StoreHeaderView = {
        let view = StoreHeaderView()
        
        return view
    }()
    
    lazy var sectionsView: BottomTypeCell = {
        let view = BottomTypeCell()
        
        return view
    }()
    
    lazy var mapView: MapView = {
        let view = MapView()
        
        return view
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
        
        contentView.addSubview(mainStack)
        
        [storeView, sectionsView, mapView].forEach { item in
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

class StoreHeaderView: UIView {
    
    lazy var mainImage: UIImageView = {
        let img = UIImageView()
        img.image = .broooIcon
        img.layer.cornerRadius = 24
        return img
    }()
    
    lazy var mainButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Подписаться", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.backgroundColor = .selectBlue
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "MacBro"
        lbl.font = .boldSystemFont(ofSize: 16)
        return lbl
    }()
    
    lazy var fallowerLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "17.5 тыс. подписчиков"
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        return stack
    }()
    
    lazy var titlesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
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
        
        [mainImage, titlesStack, mainButton].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [titleLabel, fallowerLabel].forEach { item in
            titlesStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        mainImage.snp.makeConstraints { make in
            make.width.height.equalTo(48)
        }
        mainButton.snp.makeConstraints { make in
            make.width.equalTo(105.toScreen)
        }
    }
    
}
