//
//  SingleTopCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

class SingleTopView: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var saleView: SaleTopView = {
        let view = SaleTopView()

        return view
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .vertical
        stack.alignment = .fill
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
    
    lazy var countView: SingleProductCountView = {
        let view = SingleProductCountView()
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Смартфон Apple iPhone 14 nano-SIM+eSIM, 5G, Wi-Fi 6, NFC"
        lbl.numberOfLines = 2
        lbl.font = .boldSystemFont(ofSize: 14)
        return lbl
    }()
            
    lazy var costView: CostView = {
        let view = CostView()
        
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
        view.backgroundColor = .red
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
        selectionStyle = .none
        
        contentView.addSubview(saleView)
        contentView.addSubview(backView)

        backView.addSubview(mainStack)
        
        [titlesStack, costView, selectIsNew, selectColors, selectRom].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [countView, titleLabel].forEach { item in
            titlesStack.addArrangedSubview(item)
        }
        
        [backView, saleView].forEach { item in
            item.clipsToBounds = true
            item.layer.cornerRadius = 8
//            item.layer.maskedCorners = [
//                .layerMinXMinYCorner,
//                .layerMaxXMinYCorner
//            ]
        }
        
        backgroundColor = .clear
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(0.screenWight/1.85 + 50)
            make.left.right.bottom.equalTo(contentView)
        }
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(backView).inset(12)
            make.left.right.equalTo(backView).inset(16)
        }
        costView.snp.makeConstraints { make in
            make.width.equalTo(200.toScreen)
            make.height.equalTo(50.toScreen)
        }
        saleView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView)
            make.bottom.equalTo(backView.snp_topMargin).inset(15)
        }
    }
    
}


