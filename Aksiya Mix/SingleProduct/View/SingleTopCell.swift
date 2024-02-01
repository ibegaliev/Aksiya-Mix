//
//  SingleTopCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

class SingleTopView: UITableViewCell {
    
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
        
    lazy var topImage: UIImageView = {
        let image = UIImageView()
        image.image = .macIMge
        return image
    }()
    
    lazy var countView: TitleTopView = {
        let view = TitleTopView()
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Смартфон Apple iPhone 14 nano-SIM+eSIM, 5G, Wi-Fi 6, NFC"
        lbl.numberOfLines = 2
        lbl.font = .boldSystemFont(ofSize: 14)
        return lbl
    }()
            
    lazy var costView: UIView = {
        let view = CostView()
        
        return view
    }()
    
    lazy var feedbackView: UIView = {
        let view = FeedbackView()
        
        return view
    }()

    lazy var selectIsNew: SelectableTextView = {
        let view = SelectableTextView()
        view.title = "Состояние товара"
        return view
    }()
    
    lazy var selectColors: SelectableColorView = {
        let view = SelectableColorView()
        view.title = "Цвет товара: Черный"
        return view
    }()
    
    lazy var selectRom: SelectableTextView = {
        let view = SelectableTextView()
        view.title = "Встроенная память (ROM)"
        return view
    }()
    
    
    lazy var descriptionView: DescriptionView = {
        let view = DescriptionView()
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI (){
        addSubview(mainStack)
        
        [topImage, bottomStack, descriptionView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [titlesStack, costView, feedbackView, selectIsNew, selectColors, selectRom].forEach { item in
            bottomStack.addArrangedSubview(item)
        }
        
        [countView, titleLabel].forEach { item in
            titlesStack.addArrangedSubview(item)
        }
        
        backgroundColor = .backColor

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
            make.bottom.equalTo(self).inset(12)
        }
        costView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
}


