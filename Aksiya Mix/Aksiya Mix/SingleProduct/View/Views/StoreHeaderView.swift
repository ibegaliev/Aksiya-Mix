//
//  StoreHeaderView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 16/03/24.
//

import UIKit

class StoreHeaderView: UIView {
    
    lazy var mainImage: UIImageView = {
        let img = UIImageView()
        img.image = .broooIcon
        img.layer.cornerRadius = 24
        return img
    }()
    
    lazy var mainButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitle("Подписаться", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 12, weight: .medium)
//        btn.backgroundColor = .selectBlue
        btn.layer.cornerRadius = 8
        btn.setWight()
        return btn
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "MacBro"
        lbl.font = .appFont(ofSize: 16, weight: .bold)
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
        stack.alignment = .center
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
            make.height.equalTo(36.toScreen)
        }
    }
    
}

