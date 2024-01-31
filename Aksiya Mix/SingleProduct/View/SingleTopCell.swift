//
//  SingleTopCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

class SingleTopCell: UICollectionViewCell {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 16
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.backgroundColor = .white
        return stack
    }()
    
    lazy var bottomStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 16
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var titlesStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    
    lazy var costView: UIView = {
        let view = CostView()
        
        return view
    }()
    
    lazy var topImage: UIImageView = {
        let image = UIImageView()
        image.image = .macIMge
        return image
    }()
        
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Смартфон Apple iPhone 14 nano-SIM+eSIM, 5G, Wi-Fi 6, NFC"
        lbl.numberOfLines = 2
        lbl.font = .boldSystemFont(ofSize: 14)
        return lbl
    }()
    
    lazy var countView: TitleTopView = {
        let view = TitleTopView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
        backgroundColor = .backColor
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI (){
        addSubview(mainStack)
        
        [topImage, bottomStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [titlesStack, costView].forEach { item in
            bottomStack.addArrangedSubview(item)
        }
        
        [countView, titleLabel].forEach { item in
            titlesStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        topImage.snp.makeConstraints { make in
            make.width.equalTo(0.screenWight)
            make.height.equalTo(0.screenWight)
        }
        bottomStack.snp.makeConstraints { make in
            make.width.equalTo(0.screenWight - 32)
        }
        costView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
}


