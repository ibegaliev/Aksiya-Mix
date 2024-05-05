//
//  SingleTopCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/31/24.
//

import UIKit

protocol SingleTopViewDelegate {
    func liked()
    func disliked()
}

class SingleTopView: UITableViewCell {
    
    var delegate: SingleTopViewDelegate?
    
    var data: SingleProductDM? {
        get {
            return nil
        }
        set {
            
            let data = newValue
            let discountAmount: Double = 100 - (Double(data?.discountAmount ?? "1") ?? 0)
            let price: Double = Double(data?.price ?? "1") ?? 0
            let priceInt: Int = Int(Double(data?.price ?? "1") ?? 0)
            let oldPrince = Int(price * 100 / discountAmount)
            
            discountView.title = Int(Double(data?.discountAmount ?? "1") ?? 0)
            
            saleView.titleLabel.text = "Chegirma \(data?.startDate ?? "") dan \(data?.endDate ?? "") gacha"
            titleLabel.text = data?.title
            
            countView.countLabel.text = data?.views
            countView.dataView.text = "1 xafta oldin"

            costView.oldPrince.text = formatMoneyAmount(amount: oldPrince, currency: "so'm")
            costView.newPrince.text = formatMoneyAmount(amount: priceInt, currency: "so'm")
            
            costView.feedbackView.item.likeButton.title = data?.likes
            
            costView.feedbackView.item.likeButton.isLiked = data?.userLike
            costView.feedbackView.item.likeButton.isDisLiked = data?.userDislike
            
            for item in itemsStack.arrangedSubviews {
                item.removeFromSuperview()
            }
            data?.features.forEach({ feature in
                let view = SelectableTextView()
                view.title = feature.name
                view.values = feature.values
                itemsStack.addArrangedSubview(view)
            })
            
        }
    }
    
    lazy var discountView: AksiyaDiscountView = {
        let view = AksiyaDiscountView()
        
        return view
    }()

    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
//        view.backgroundColor = .red
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
    
    lazy var itemsStack: UIStackView = {
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
        lbl.numberOfLines = 2
        lbl.font = .appFont(ofSize: 16, weight: .bold)
        return lbl
    }()
            
    lazy var costView: CostView = {
        let view = CostView()
        view.delegate = self
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
        
        contentView.addSubview(discountView)
        
        backView.addSubview(mainStack)
        
        [titlesStack, costView, itemsStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        
        [countView, titleLabel].forEach { item in
            titlesStack.addArrangedSubview(item)
        }
        
        [backView, saleView].forEach { item in
            item.clipsToBounds = true
            item.layer.cornerRadius = 8
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
        discountView.snp.makeConstraints { make in
            make.top.equalTo(backView)
            make.right.equalTo(contentView).inset(12)
            make.width.height.equalTo(50)
        }
    }
    
}

extension SingleTopView: CostViewDelegate {
    
    func liked() {
        delegate?.liked()
    }
    
    func disliked() {
        delegate?.disliked()
    }
    
}
